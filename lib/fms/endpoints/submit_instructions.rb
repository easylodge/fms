module Endpoints
  module SubmitInstructions

    def create(instructions)
      post("deal", body(instructions))
    end

    # Format the data into the format FMS expects
    # NOTE: All keys are required.
    # NOTE: Values will be converted to the type expected.
    def body(data)
      return [] if data.nil? || data.empty?

      application = data[:content][:application]
      overview = application[:overview]
      contact_person = application[:sales_channel][:company][:contact][:contact_person]
      publisher = data[:publisher]

      body = {
        "Package": {
          "@ProductionData": production_data(),
          "@UniqueID": data[:unique_id],
          "Content": {
            "Application": {
              "@ProductionData": production_data(),
              "Address": addresses(application[:addresses]),
              "DetailedComment": detailed_comments(application[:detailed_comments]),
              "Insurance": insurances(application[:insurances]),
              "Liability": liabilities(application[:liabilities]),
              "LoanDetails": loan_details(application[:loan_details]),
              "NonRealEstateAsset": non_real_estate_assets(application[:non_real_estate_assets]),
              "Overview": {
                "@ApplicationType": overview[:application_type],
                "@CombinationLoan": overview[:combination_loan],
                "@DocType": overview[:doc_type],
                "@DocumentGenerationEngineReferenceNumber": overview[:document_generation_engine_reference_number].to_s,
                "@FHLDSApproved": overview[:fhlds_approved],
                "@LenderApplicationReferenceNumber": overview[:lender_application_reference_number],
                "TermsAndConditions": [
                  {
                    "@TermsDescription": overview[:terms_and_conditions][:terms_description],
                    "@TermsName": overview[:terms_and_conditions][:terms_name]
                  }
                ]
              },
              "PersonApplicant": person_applicants(application[:person_applicants]),
              "RealEstateAsset": real_estate_assets(application[:real_estate_assets]),
              "RelatedPerson": related_people(application[:related_people]),
              "SalesChannel": {
                "Commission": commissions(application[:sales_channel][:commissions]),
                "Company": {
                  "Contact": {
                    "ContactPerson": {
                      "@Email": contact_person[:email],
                      "@FirstName": contact_person[:first_name],
                      "@Role": contact_person[:role],
                      "@Surname": contact_person[:surname],
                      "@x_ContactPerson": contact_person[:contact_person]
                    }
                  }
                }
              },
              "Summary": {
                "@FeesDisclosureDate": application[:summary][:fees_disclosure_date],
                "Fee": fees(application[:summary][:fees])
              },
              "RelatedCompany": [
                {
                  "@UniqueID": application[:related_company][:unique_id],
                  "@CompanyName": application[:related_company][:company_name]
                }
              ]
            }
          },
          "Instructions": instructions(data[:instructions]),
          "Publisher": {
            "@CompanyName": publisher[:company_name],
            "@ContactName": publisher[:contact_name],
            "@Email": publisher[:email],
            "@LIXICode": publisher[:lixi_code],
            "@PublishedDateTime": publisher[:published_date_time],
            "Software": {
              "@Description": publisher[:software][:description],
              "@LIXICode": publisher[:software][:lixi_code],
            }
          },
          "Recipient": recipients(data[:recipients]),
          "BusinessChannel": {
            "Contact": {
                "@Email": data[:business_channel][:contact][:email],
            }
          },
          "SchemaVersion": {
            "@LIXITransactionType": data[:schema_version][:lixi_transaction_type],
            "@LIXIVersion": data[:schema_version][:lixi_version],
          }
        }
      }

      body
    end

    def addresses(addresses)
      return [] if addresses.nil? || addresses.empty?

      result = []

      addresses.each do |address|
        result << {
          "@AustralianPostCode": address[:australian_post_code].to_s,
          "@AustralianState": address[:australian_state],
          "@Country": address[:country],
          "@Suburb": address[:suburb],
          "@Type": address[:type],
          "@UniqueID": address[:unique_id],
          "Standard": address_standard(address[:standard])
        }
      end

      result
    end

    def address_standard(address)
      standard = {}
      standard["@StreetName"] = address[:street_name] unless address[:street_name].to_s.empty?
      standard["@StreetNumber"] = address[:street_number].to_s unless address[:street_number].to_s.empty?
      standard["@StreetType"] = address[:street_type] unless address[:street_type].to_s.empty?
      standard["@Unit"] = address[:unit] unless address[:unit].to_s.empty?
      standard["@UnitType"] = address[:unit_type] unless address[:unit_type].to_s.empty?

      standard
    end

    def detailed_comments(comments)
      return [] if comments.nil? || comments.empty?

      result = []

      comments.each do |comment|
        result << {
          "Comment": {
            "$": comment[:comment]
          }
        }
      end

      result
    end

    def insurances(insurances)
      return [] if insurances.nil? || insurances.empty?

      result = []

      insurances.each do |insurance|
        amount = (insurance[:premium] && insurance[:premium][:amount])? insurance[:premium][:amount].to_f : nil

        result << {
          "@InsuranceType": insurance[:insurance_type],
          "@Insurer": insurance[:insurer],
          "@UniqueID": insurance[:unique_id],
          "AssociatedLoanAccount": insurance_associated_accounts(insurance[:associated_loan_accounts]),
          "Premium": {
            "@Amount": amount
          }
        }
      end

      result
    end

    def insurance_associated_accounts(associated_loan_accounts)
      return [] if associated_loan_accounts.nil? || associated_loan_accounts.empty?

      result = []

      associated_loan_accounts.each do |associated_loan_account|
        result << {
          "@x_AssociatedLoanAccount": associated_loan_account[:associated_loan_account]
        }
      end

      result
    end

    def liabilities(liabilities)
      return [] if liabilities.nil? || liabilities.empty?

      result = []

      liabilities.each do |liability|
        result << {
          "@ClosingOnSettlement": liability[:closing_on_settlement],
          "@ClearingFromThisLoan": liability[:clearing_from_this_loan],
          "@ClearingFromThisLoanAmount": liability[:clearing_from_this_loan_amount].to_i,
          "@OutstandingBalance": liability[:outstanding_balance].to_i,
          "@Type": liability[:type],
          "PercentOwned": {
            "Owner": liability_owners(liability[:percent_owned][:owners])
          }
        }
      end

      result
    end

    def liability_owners(owners)
      return [] if owners.nil? || owners.empty?

      result = []

      owners.each do |owner|
        result << {
          "@x_Party": owner[:party]
        }
      end

      result
    end

    def loan_details(details)
      return [] if details.nil? || details.empty?

      result = []

      details.each do |detail|
        documentation_instructions = detail[:documentation_instructions]
        proposed_repayment = detail[:proposed_repayment]
        term = detail[:term]

        result << {
          "@AmountRequested": detail[:amount_requested].to_i,
          "@EstimatedSettlementDate": detail[:estimated_settlement_date],
          "@Funder": detail[:funder],
          "@LoanType": detail[:loan_type],
          "@MainProduct": detail[:main_product],
          "@ProductCode": detail[:product_code],
          "@ProductName": detail[:product_name],
          "@Secured": detail[:secured],
          "@TaxDeductible": detail[:tax_deductible],
          "@UniqueID": detail[:unique_id],
          "Borrowers": {
            "@Proportions": detail[:borrowers][:proportions],
            "Owner": borrower_owners(detail[:borrowers][:owners])
          },
          "DiscountMargin": discount_margins(detail[:discount_margins]),
          "DocumentationInstructions": {
            "@Method": documentation_instructions[:method],
            "@SendDocumentsTo": documentation_instructions[:send_documents_to]
          },
          "FeaturesSelected": {
            "@RateLock": detail[:features_selected][:rate_lock],
            "OffsetAccount": offset_accounts(detail[:features_selected][:offset_accounts])
          },
          "LendingPurpose": lending_purposes(detail[:lending_purposes]),
          "LoanPurpose": {
            "@NCCPStatus": detail[:loan_purpose][:nccp_status],
            "@PrimaryPurpose": detail[:loan_purpose][:primary_purpose]
          },
          "ProposedRepayment": {
            "@AnniversaryDate": proposed_repayment[:anniversary_date],
            "@Regular": proposed_repayment[:regular],
            "RegularRepayment": regular_repayments(proposed_repayment[:regular_repayments]),
            "StructuredPayments": {
              "Payment": structured_payments(proposed_repayment[:structured_payments][:payments])
            }
          },
          "RateComposition": rate_compositions(detail[:rate_compositions]),
          "Security": securities(detail[:securities]),
          "FundsDisbursement": funds_disburements(detail[:funds_disburements]),
          "Term": {
            "@InterestType": term[:interest_type],
            "@InterestTypeDuration": term[:interest_type_duration].to_i,
            "@InterestTypeUnits": term[:interest_type_units],
            "@PaymentType": term[:payment_type],
            "@PaymentTypeDuration": term[:payment_type_duration].to_i,
            "@PaymentTypeUnits": term[:payment_type_units],
            "@TotalInterestAmount": term[:total_interest_amount].to_i,
            "@TotalTermDuration": term[:total_term_duration].to_i,
            "@TotalTermType": term[:total_term_type],
            "@TotalTermUnits": term[:total_term_units],
            "DistinctLoanPeriod": distinct_loan_periods(term[:distinct_loan_periods])
          },
          "EquityRelease": {
            "Amount": {
              "@CalculateAsPercentage": detail[:equity_release][:amount][:calculate_as_percentage],
              "@LumpSum": detail[:equity_release][:amount][:lump_sum].to_i,
            }
          }
        }
      end

      result
    end

    def borrower_owners(owners)
      return [] if owners.nil? || owners.empty?

      result = []

      owners.each do |owner|
        result << {
          "@x_Party": owner[:party]
        }
      end

      result
    end

    def discount_margins(margins)
      return [] if margins.nil? || margins.empty?

      result = []

      margins.each do |margin|
        result << {
          "@DiscountRate":margin[:discount_rate].to_f,
          "@DiscountReason": margin[:discount_reason],
          "@Duration": margin[:duration].to_i,
          "@DurationUnits": margin[:duration_units]
        }
      end

      result
    end

    def offset_accounts(accounts)
      return [] if accounts.nil? || accounts.empty?

      result = []

      accounts.each do |account|
        result << {
          "@IsExisting": account[:is_existing]
        }
      end

      result
    end

    def lending_purposes(purposes)
      return [] if purposes.nil? || purposes.empty?

      result = []

      purposes.each do |purpose|
        result << {
          "@ABSLendingPurposeCode": purpose[:abs_lending_purpose_code],
          "@PurposeAmount": purpose[:purpose_amount].to_i
        }
      end

      result
    end

    def regular_repayments(repayments)
      return [] if repayments.nil? || repayments.empty?

      result = []

      repayments.each do |repayment|
        result << {
          "@Amount": repayment[:amount].to_f,
          "@Frequency": repayment[:frequency],
          "@LastRepaymentDate": repayment[:last_repayment_date],
          "@TotalRepayments": repayment[:total_repayments].to_i
        }
      end

      result
    end

    def structured_payments(payments)
      return [] if payments.nil? || payments.empty?

      result = []

      payments.each do |payment|
        result << {
          "@Amount": payment[:amount].to_f,
          "@SequenceNumber": payment[:sequence_number].to_i
        }
      end

      result
    end

    def rate_compositions(compositions)
      return [] if compositions.nil? || compositions.empty?

      result = []

      compositions.each do |rate_composition|
        result << {
          "@UniqueID": rate_composition[:unique_id],
          "BaseRate": {
            "@Name": rate_composition[:base_rate][:name],
            "@Rate": rate_composition[:base_rate][:rate].to_f
          }
        }
      end

      result
    end

    def securities(securities)
      return [] if securities.nil? || securities.empty?

      result = []

      securities.each do |security|
        result << {
          "@Priority": security[:priority],
          "@x_Security": security[:security]
        }
      end

      result
    end

    def funds_disburements(disburements)
      return [] if disburements.nil? || disburements.empty?

      result = []

      disburements.each do |disburement|
        result << {
          "CompanyName": disburement[:company_name],
          "Amount": disburement[:amount].to_i
        }
      end

      result
    end

    def distinct_loan_periods(periods)
      return [] if periods.nil? || periods.empty?

      result = []

      periods.each do |period|
        result << {
          "@x_RateComposition": period[:rate_composition]
        }
      end

      result
    end

    def non_real_estate_assets(assets)
      return [] if assets.nil? || assets.empty?

      result = []

      assets.each do |asset|
        result << {
          "@AssetReferenceNumber": asset[:asset_reference_number].to_s,
          "@Transaction": asset[:transaction],
          "@Type": asset[:type],
          "@UniqueID": asset[:unique_id],
          "EstimatedValue": {
            "@EstimateBasis": asset[:estimated_value][:estimate_basis],
            "@Value": asset[:estimated_value][:value].to_i
          }
        }
      end

      result
    end

    def person_applicants(applicants)
      return [] if applicants.nil? || applicants.empty?

      result = []

      applicants.each do |applicant|
        result << {
          "@ApplicantType": applicant[:applicant_type],
          "@Citizenship": applicant[:citizenship],
          "@FirstHomeBuyer": applicant[:first_home_buyer],
          "@Gender": applicant[:gender],
          "@IndependentFinancialAdvice": applicant[:independent_financial_advice],
          "@IndependentFinancialAdviceRequirement": applicant[:independent_financial_advice_requirement],
          "@IsExistingCustomer": applicant[:is_existing_customer],
          "@MaritalStatus": applicant[:marital_status],
          "@PrimaryApplicant": applicant[:primary_applicant],
          "@ResidencyStatus": applicant[:residency_status],
          "@UniqueID": applicant[:unique_id],
          "Contact": {
            "CurrentAddress": {
              "@HousingStatus": applicant[:contact][:current_address][:housing_status],
              "@x_MailingAddress": applicant[:contact][:current_address][:mailing_address],
              "@x_ResidentialAddress": applicant[:contact][:current_address][:residential_address]
            },
            "EmailAddress": email_addresses(applicant[:contact][:email_addresses]),
            "Mobile": {
              "@CountryCode": applicant[:contact][:mobile][:country_code].to_s,
              "@Number": applicant[:contact][:mobile][:number]
            }
          },
          "Employment": employments(applicant[:employments]),
          "PersonName": {
            "@FirstName": applicant[:person_name][:first_name],
            "@NameTitle": applicant[:person_name][:name_title],
            "@Surname": applicant[:person_name][:surname]
          },
          "Privacy": {
            "@AllowCreditCheck": applicant[:privacy][:allow_credit_check],
            "@CreditAuthoritySigned": applicant[:privacy][:credit_authority_signed],
            "@PrivacyActConsentSigned": applicant[:privacy][:privacy_act_consent_signed]
          },
          "ProofOfIdentity": proof_of_identities(applicant[:proof_of_identities])
        }
      end

      result
    end

    def email_addresses(email_addresses)
      return [] if email_addresses.nil? || email_addresses.empty?

      result = []

      email_addresses.each do |email_address|
        result << {
          "@Email": email_address[:email],
          "@EmailType": email_address[:email_type]
        }
      end

      result
    end

    def employments(employments)
      return [] if employments.nil? || employments.empty?

      result = []

      employments.each do |employment|
        result << {
          "PAYG": {
            "@Occupation": employment[:payg][:occupation],
            "@Status": employment[:payg][:status],
            "Income": {
              "@GrossSalaryAmount": employment[:payg][:income][:gross_salary_amount].to_i,
              "@GrossSalaryFrequency": employment[:payg][:income][:gross_salary_frequency]
            }
          }
        }
      end

      result
    end

    def proof_of_identities(proof_of_identities)
      return [] if proof_of_identities.nil? || proof_of_identities.empty?

      result = []

      proof_of_identities.each do |proof_of_identity|
        result << {
          "@DateDocumentVerified": proof_of_identity[:date_document_verified],
        }
      end

      result
    end

    def real_estate_assets(assets)
      return [] if assets.nil? || assets.empty?

      result = []

      assets.each do |asset|
        result << {
          "@Construction": asset[:construction],
          "@PrimaryUsage": asset[:primary_usage],
          "@PropertyID": asset[:property_id],
          "@ToBeUsedAsSecurity": asset[:to_be_used_as_security],
          "@Transaction": asset[:transaction],
          "@UniqueID": asset[:unique_id],
          "ContractDetails": {
            "@ContractPriceAmount": asset[:contract_details][:contract_price_amount].to_i,
          },
          "Encumbrance": encumbrances(asset[:encumbrances]),
          "Insurance": real_estate_insurances(asset[:insurances]),
          "PercentOwned": {
            "@Proportions": asset[:percent_owned][:proportions],
            "Owner": owners(asset[:percent_owned][:owners])
          },
          "Title": [
            {
              "@Volume": asset[:title][:volume],
              "@Folio": asset[:title][:folio],
            }
          ],
          "EstimatedValue": {
            "@Value": asset[:estimated_value][:value].to_i,
            "@ValuedDate": asset[:estimated_value][:valued_date],
            "@x_Valuer": asset[:estimated_value][:valuer]
          }
        }
      end

      result
    end

    def related_people(related_people)
      return [] if related_people.nil? || related_people.empty?

      result = []

      related_people.each do |related_person|
        result << {
          "@UniqueID": related_person[:unique_id],
        }
      end

      result
    end

    def commissions(commissions)
      return [] if commissions.nil? || commissions.empty?

      result = []

      commissions.each do |commission|
        result << {
          "@Trail": commission[:trail].to_f,
        }
      end

      result
    end

    def encumbrances(encumbrances)
      return [] if encumbrances.nil? || encumbrances.empty?

      result = []

      encumbrances.each do |encumbrance|
        result << {
          "@Description": encumbrance[:description],
          "@EncumbranceType": encumbrance[:encumbrance_type],
          "@RegisteredNumber": encumbrance[:registered_number],
          "@Priority": encumbrance[:priority],
          "@PriorityAmount": encumbrance[:priority_amount].to_i,
          "InFavourOf": in_favour_ofs(encumbrance[:in_favour_ofs])
        }
      end

      result
    end

    def in_favour_ofs(in_favour_ofs)
      return [] if in_favour_ofs.nil? || in_favour_ofs.empty?

      result = []

      in_favour_ofs.each do |in_favour_of|
        result << {
          "@Name": in_favour_of[:name]
        }
      end

      result
    end

    def real_estate_insurances(insurances)
      return [] if insurances.nil? || insurances.empty?

      result = []

      insurances.each do |insurance|
        result << {
          "@x_Insurance": insurance[:insurance]
        }
      end

      result
    end

    def owners(owners)
      return [] if owners.nil? || owners.empty?

      result = []

      owners.each do |owner|
        result << {
          "@x_Party": owner[:party]
        }
      end

      result
    end

    def titles(titles)
      return [] if titles.nil? || titles.empty?

      result = []

      titles.each do |title|
        result << {
          "@DuplicateTitleIssued": title[:duplicate_title_issued],
          "@Lot": title[:lot].to_i,
          "@Plan": title[:plan].to_i,
          "@PlanType": title[:plan_type],
          "@TitleReference": title[:title_reference],
          "Folio": title[:folio],
          "Volume": title[:volume]
        }
      end

      result
    end

    def fees(fees)
      return [] if fees.nil? || fees.empty?

      result = []

      fees.each do |fee|
        result << {
          "@Amount": fee[:amount].to_i,
          "@Description": fee[:description],
          "@Frequency": fee[:frequency],
          "@PayFeesFrom": fee[:pay_fees_from],
          "@Type": fee[:type]
        }
      end

      result
    end

    def instructions(instructions)
      return [] if instructions.nil? || instructions.empty?

      conditions = instructions[:documents_and_settlement_instructions][:submit][:conditions]
      generated_documents = instructions[:documents_and_settlement_instructions][:submit][:generate_documents]

      documents_and_settlement_instructions = {
        "DocumentsAndSettlementInstructions": {
          "Submit": {
            "@Type": instructions[:documents_and_settlement_instructions][:submit][:type],
            "Condition": instruction_conditions(conditions),
            "GenerateDocument": instruction_generated_documents(generated_documents)
          }
        }
      }

      documents_and_settlement_instructions
    end

    def instruction_conditions(conditions)
      return [] if conditions.nil? || conditions.empty?

      result = []

      conditions.each do |condition|
        result << {
          "@ConditionCode": condition[:condition_code].to_i,
          "@ConditionOwner": condition[:condition_owner],
          "@ConditionStatus": condition[:condition_status],
          "@CreatedDateTime": condition[:created_date_time],
          "@DocRequirement": condition[:doc_requirement],
          "@PreconditionToStage": condition[:precondition_to_stage],
          "@UpdatedDateTime": condition[:updated_date_time]
        }
      end

      result
    end

    def instruction_generated_documents(generated_documents)
      return [] if generated_documents.nil? || generated_documents.empty?

      result = []

      generated_documents.each do |generated_document|
        result << {
          "@DeliveryType": generated_document[:delivery_type],
          "@DocumentName": generated_document[:document_name],
          "Context": {
            "@Type": generated_document[:context][:type],
            "@x_Context": generated_document[:context][:context]
          }
        }
      end

      result
    end

    def recipients(recipients)
      return [] if recipients.nil? || recipients.empty?

      result = []

      recipients.each do |recipient|
        result << {
          "@Description": recipient[:description],
          "@LIXICode": recipient[:lixi_code],
        }
      end

      result
    end

    def production_data
      @production ? "Yes" : "No"
    end
  end
end