require "spec_helper"

RSpec.describe Endpoints::SubmitInstructions do
  let(:subject) { FmsApiIntegration::Api.new("username", "password", false) { extend Endpoints::SubmitInstructions } }
  let(:example_file) { File.read("spec/lib/fms_api_integration/endpoints/submit_instructions_body_example.json") }

  describe "#body" do
    let(:params) {
      {
        "unique_id": "id9001",
        "content": {
          "application": {
            "addresses": [
              {
                "australian_post_code": 2668,
                "australian_state": "NSW",
                "country": "AU",
                "suburb": "BARMEDMAN",
                "type": "Standard",
                "unique_id": "id9002",
                "standard": {
                  "street_name": "Shea Common",
                  "street_number": 81,
                  "street_type": "Street",
                  "unit": 9,
                  "unit_type": "Apartment"
                }
              },
              {
                "australian_post_code": 2105,
                "australian_state": "NSW",
                "country": "AU",
                "suburb": "MORNING BAY",
                "type": "Standard",
                "unique_id": "id9003",
                "standard": {
                  "street_name": "Gary Elbow",
                  "street_number": 74,
                  "street_type": "Road"
                }
              }
            ],
            "detailed_comments": [
              {
                "comment": {
                  "$": "A DAS Sample for a Variable Term Loan with an Owner Occupied Established Security that has multiple borrowers and includes different application fees."
                }
              }
            ],
            "insurances": [
              {
                "insurance_type": "Building Insurance",
                "insured_amount": 900000,
                "insurer": "QBE",
                "unique_id": "id9004"
              },
              {
                "insurance_type": "LMI",
                "insurer": "Genworth Financial",
                "associated_loan_accounts": [
                  {
                    "associated_loan_account": "id9005"
                  }
                ],
                "premium": {
                  "amount": 9999.99
                }
              }
            ],
            "liabilities": [
              {
                "closing_on_settlement": "Yes",
                "clearing_from_this_loan": "Yes",
                "outstanding_balance": 20000,
                "type": "Amortising Home Loan",
                "percent_owned": {
                  "owners": [
                    {
                      "party": "id9006"
                    }
                  ]
                }
              }
            ],
            "loan_details": [
              {
                "amount_requested": 500000,
                "estimated_settlement_date": "2020-05-13",
                "funder": "Loanworks",
                "loan_type": "Amortising Home Loan",
                "main_product": "Yes",
                "product_code": "ILMCICPM",
                "product_name": "Term Loan Variable Interest",
                "secured": "Yes",
                "tax_deductible": "No",
                "unique_id": "id9005",
                "borrowers": {
                  "proportions": "Equal",
                  "owners": [
                    {
                      "party": "id9006"
                    },
                    {
                      "party": "id9007"
                    }
                  ]
                },
                "discount_margins": [
                  {
                    "discount_rate": 0.99,
                    "discount_reason": "Honeymoon Rate",
                    "duration": 12,
                    "duration_units": "Months"
                  }
                ],
                "documentation_instructions": {
                  "method": "Email",
                  "send_documents_to": "All"
                },
                "features_selected": {
                  "rate_lock": "No",
                  "offset_accounts": [
                    {
                      "is_existing": "No"
                    }
                  ]
                },
                "lending_purposes": [
                  {
                    "abs_lending_purpose_code": "ABS-129",
                    "purpose_amount": 450000
                  }
                ],
                "loan_purpose": {
                  "nccp_status": "Regulated",
                  "primary_purpose": "Owner Occupied"
                },
                "proposed_repayment": {
                  "anniversary_date": "2017-08-07",
                  "regular": "Yes",
                  "regular_repayments": [
                    {
                      "amount": 3107.92,
                      "frequency": "Monthly",
                      "last_repayment_date": "2024-08-23",
                      "total_repayments": 300
                    }
                  ],
                  "structured_payments": {
                    "payments": [
                      {
                        "amount": 3095.62,
                        "sequence_number": 1
                      }
                    ]
                  }
                },
                "rate_compositions": [
                  {
                    "unique_id": "ID0777",
                    "base_rate": {
                      "name": "Annual Variable Rate",
                      "rate": 3.79
                    }
                  }
                ],
                "securities": [
                  {
                    "priority": "Registered Security",
                    "security": "id9009"
                  }
                ],
                "term": {
                  "interest_type": "Variable",
                  "interest_type_duration": 300,
                  "interest_type_units": "Months",
                  "payment_type": "Interest Partially Capitalised",
                  "payment_type_duration": 299,
                  "payment_type_units": "Months",
                  "total_interest_amount": 15850,
                  "total_term_duration": 25,
                  "total_term_type": "Total Term",
                  "total_term_units": "Years",
                  "distinct_loan_periods": [
                    {
                      "rate_composition": "ID0777"
                    }
                  ]
                }
              }
            ],
            "non_real_estate_assets": [
              {
                "asset_reference_number": 522658,
                "transaction": "Transfer",
                "type": "Financial Asset",
                "unique_id": "NREA-001",
                "estimated_value": {
                  "estimate_basis": "Applicant Estimate",
                  "value": 4000000
                },
                "financial_asset": {
                  "account_number": {
                    "financial_institution": "Infinity Group Finance Pty Ltd"
                  }
                }
              }
            ],
            "overview": {
              "application_type": "Loan",
              "combination_loan": "No",
              "doc_type": "Full Doc",
              "document_generation_engine_reference_number": 2234599,
              "fhlds_approved": "Yes",
              "lender_application_reference_number": "111LIXI11222"
            },
            "person_applicants": [
              {
                "applicant_type": "Borrower",
                "citizenship": "AU",
                "first_home_buyer": "No",
                "gender": "Male",
                "independent_financial_advice": "Yes",
                "independent_financial_advice_requirement": "Recommended",
                "is_existing_customer": "No",
                "marital_status": "Single",
                "primary_applicant": "Yes",
                "residency_status": "Permanently in Australia",
                "unique_id": "id9006",
                "contact": {
                  "current_address": {
                    "housing_status": "Own Home",
                    "mailing_address": "id9002",
                    "residential_address": "id9002"
                  },
                  "email_addresses": [
                    {
                      "email": "ohunt@cruz.com",
                      "email_type": "Home"
                    }
                  ],
                  "mobile": {
                    "country_code": 61,
                    "number": 8441241769
                  }
                },
                "employments": [
                  {
                    "payg": {
                      "occupation": "Education, health or welfare services professional",
                      "status": "Primary",
                      "income": {
                        "gross_salary_amount": 50000,
                        "gross_salary_frequency": "Yearly",
                        "proof_code": "Payslip",
                        "proof_sighted": "Yes"
                      }
                    }
                  }
                ],
                "person_name": {
                  "first_name": "Brent",
                  "middle_names": "Rick",
                  "name_title": "Mr",
                  "surname": "Luna"
                },
                "privacy": {
                  "allow_credit_check": "Yes",
                  "credit_authority_signed": "Yes",
                  "privacy_act_consent_signed": "Yes"
                },
                "proof_of_identities": [
                  {
                    "document_number": "ES12456",
                    "document_type": "ImmiCard",
                    "issuing_organisation": "ZIPID"
                  }
                ]
              },
              {
                "applicant_type": "Borrower",
                "citizenship": "AU",
                "first_home_buyer": "No",
                "gender": "Female",
                "independent_financial_advice": "No",
                "independent_financial_advice_requirement": "Not Required",
                "is_existing_customer": "No",
                "marital_status": "Single",
                "primary_applicant": "No",
                "residency_status": "Permanently in Australia",
                "unique_id": "id9007",
                "contact": {
                  "current_address": {
                    "housing_status": "Own Home",
                    "mailing_address": "id9002",
                    "residential_address": "id9002"
                  },
                  "email_addresses": [
                    {
                      "email": "jmcgee@hahn.net",
                      "email_type": "Home"
                    }
                  ],
                  "mobile": {
                    "country_code": 61,
                    "number": 4134520920
                  }
                },
                "employments": [
                  {
                    "payg": {
                      "occupation": "Education, health or welfare services professional",
                      "status": "Primary",
                      "unique_id": "id9008",
                      "income": {
                        "gross_salary_amount": 50000,
                        "gross_salary_frequency": "Yearly",
                        "proof_code": "Payslip",
                        "proof_sighted": "Yes"
                      }
                    }
                  }
                ],
                "person_name": {
                  "first_name": "Katherine",
                  "middle_names": "Erin",
                  "name_title": "Ms",
                  "surname": "Jordan"
                },
                "privacy": {
                  "allow_credit_check": "Yes",
                  "credit_authority_signed": "Yes",
                  "privacy_act_consent_signed": "Yes"
                },
                "proof_of_identities": [
                  {
                    "issuing_organisation": "ZIPID"
                  }
                ]
              }
            ],
            "real_estate_assets": [
              {
                "construction": "No",
                "primary_usage": "Commercial",
                "property_id": "lender_property_ID",
                "to_be_used_as_security": "Yes",
                "transaction": "Purchasing",
                "unique_id": "id9009",
                "address": "id9003",
                "commercial": {
                  "type": "Retail"
                },
                "contract_details": {
                  "contract_price_amount": 890000
                },
                "encumbrances": [
                  {
                    "description": "A Mortgage",
                    "encumbrance_type": "Mortgage",
                    "registered_number": 456456456,
                    "in_favour_ofs": [
                      {
                        "name": "Commonwealth Bank of Australia"
                      }
                    ]
                  }
                ],
                "insurances": [
                  {
                    "insurance": "id9004"
                  }
                ],
                "percent_owned": {
                  "proportions": "Equal",
                  "owners": [
                    {
                      "party": "id9006"
                    },
                    {
                      "party": "id9007"
                    }
                  ]
                },
                "titles": [
                  {
                    "duplicate_title_issued": "No",
                    "lot": 15,
                    "plan": 222741,
                    "plan_type": "Deposited Plan",
                    "title_reference": "15/222741"
                  }
                ]
              }
            ],
            "related_people": [
              {
                "unique_id": "RP-005"
              }
            ],
            "sales_channel": {
              "commissions": [
                {
                  "trail": 1.2
                }
              ],
              "company": {
                "contact": {
                  "contact_person": {
                    "email": "AJospeh@saleschannel.com.au",
                    "first_name": "Anthony",
                    "name_title": "Mr",
                    "role": "Auditor",
                    "surname": "Joseph",
                    "contact_person": "RP-005"
                  }
                }
              }
            },
            "summary": {
              "fees_disclosure_date": "2017-06-07",
              "fees": [
                {
                  "amount": 20,
                  "description": "Monthly Service Fee",
                  "frequency": "Monthly",
                  "pay_fees_from": "Account",
                  "payable_to": "LIXIBank",
                  "type": "Loan Fee"
                },
                {
                  "amount": 1000,
                  "description": "Discharge Administration Fee",
                  "frequency": "One Off",
                  "pay_fees_from": "Account",
                  "payable_to": "LIXIBank",
                  "type": "Loan Fee"
                },
                {
                  "amount": 100,
                  "description": "Valuation Fee",
                  "frequency": "One Off",
                  "pay_fees_from": "Included in Loan Amount",
                  "payable_to": "LIXIBank",
                  "type": "Valuation Fee",
                  "security": "id9009"
                },
                {
                  "amount": 200,
                  "description": "Establishment Fee",
                  "frequency": "One Off",
                  "pay_fees_from": "Included in Loan Amount",
                  "payable_to": "LIXIBank",
                  "type": "Establishment Fee"
                },
                {
                  "amount": 50,
                  "description": "Search Processing Fee",
                  "frequency": "One Off",
                  "pay_fees_from": "Included in Loan Amount",
                  "payable_to": "LIXIBank",
                  "type": "Land Titles Office Search Fee"
                },
                {
                  "amount": 275,
                  "description": "Solicitors Fee",
                  "frequency": "One Off",
                  "pay_fees_from": "Included in Loan Amount",
                  "payable_to": "Solicitor ABC",
                  "type": "Legal Fee"
                }
              ],
              "loan_to_valuation_ratio": {
                "application_lvr": 0.5
              }
            }
          }
        },
        "instructions": {
          "documents_and_settlement_instructions": {
            "submit": {
              "type": "Loan Documents Request",
              "conditions": [
                {
                  "condition_code": 4412,
                  "condition_owner": "Loan Officer",
                  "condition_status": "Not Satisfied",
                  "created_date_time": "2020-01-07T08:46:40",
                  "doc_requirement": "No",
                  "precondition_to_stage": "Conditional Approval",
                  "updated_date_time": "2020-03-23T08:46:40"
                }
              ],
              "generate_documents": [
                {
                  "delivery_type": "Email",
                  "document_name": "Loan Contract",
                  "context": {
                    "type": "Loan Account",
                    "context": "id9005"
                  }
                }
              ]
            }
          }
        },
        "publisher": {
          "company_name": "Dunn-Thomas Group Pty Ltd",
          "contact_name": "William Quinn",
          "email": "hmartin@hotmail.com.au",
          "lixi_code": "LIXIBRKR",
          "published_date_time": "2020-05-12T10:00:00",
          "software": {
            "description": "LoanLodger",
            "lixi_code": "LIXIBANK"
          }
        },
        "recipients": [
          {
            "description": "A description of the system.",
            "lixi_code": "LIXILIXI"
          }
        ],
        "business_channel": {
          "contact": {
              "email": "test@email.com",
          }
        },
        "schema_version": {
          "lixi_transaction_type": "DAS",
          "lixi_version": "2.2.41"
        }
      }
     }
    let(:response) { subject.body(params) }

    it "returns a hash" do
      expect(response).to be_a(Hash)
    end
  end

  describe "#detailed_comments" do
    let(:params) {
      [
        {
          "comment": "A DAS Sample for a Variable Term Loan with an Owner Occupied Established Security that has multiple borrowers and includes different application fees.",
        },
        {
          "comment": "The DAS is a JSON document that is used to request a loan from a lender.",
        }
      ]
    }
    let(:response) { subject.detailed_comments(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response).to all(be_a(Hash))
    end

    it "returns an array of 2 hashes" do
      expect(response.size).to eq(2)
    end

    it "returns an array with the correct keys" do
      expect(response.first.keys).to eq([:"Comment"])
    end

    it "returns an array with the correct values" do
      expect(response.first.values).to eq([
        "$": "A DAS Sample for a Variable Term Loan with an Owner Occupied Established Security that has multiple borrowers and includes different application fees."
      ])
    end
  end

  describe "#addresses" do
    let(:params) {
      [
        {
          "australian_post_code": 2668,
          "australian_state": "NSW",
          "country": "AU",
          "suburb": "BARMEDMAN",
          "type": "Standard",
          "unique_id": "id9002",
          "standard": {
            "street_name": "Shea Common",
            "street_number": 81,
            "street_type": "Street",
            "unit": 9,
            "unit_type": "Apartment"
          }
        },
        {
          "australian_post_code": 2105,
          "australian_state": "NSW",
          "country": "AU",
          "suburb": "MORNING BAY",
          "type": "Standard",
          "unique_id": "id9003",
          "standard": {
            "street_name": "Gary Elbow",
            "street_number": 74,
            "street_type": "Road"
          }
        }
      ]
    }
    let(:response) { subject.addresses(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@AustralianPostCode,
        :@AustralianState,
        :@Country,
        :@Suburb,
        :@Type,
        :@UniqueID,
        :Standard
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        "2668",
        "NSW",
        "AU",
        "BARMEDMAN",
        "Standard",
        "id9002",
        {
          "@StreetName" => "Shea Common",
          "@StreetNumber" => "81",
          "@StreetType" => "Street",
          "@Unit" => 9,
          "@UnitType" => "Apartment"
        }
      ])
    end
  end

  describe "#insurances" do
    let(:params) {
      [
        {
          "insurance_type": "LMI",
          "insurer": "Genworth Financial",
          "associated_loan_accounts": [
            {
              "associated_loan_account": "id9005"
            }
          ],
          "premium": {
            "amount": 9999.99
          }
        },
        {
          "insurance_type": "Building Insurance",
          "insured_amount": 900000,
          "insurer": "QBE",
          "unique_id": "id9004",
          "associated_loan_accounts": [
            {
              "associated_loan_account": "id9005"
            }
          ],
          "premium": {
            "amount": 9999.99
          }
        }
      ]
    }
    let(:response) { subject.insurances(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@InsuranceType,
        :@Insurer,
        :@UniqueID,
        :AssociatedLoanAccount,
        :Premium
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        "LMI",
        "Genworth Financial",
        nil,
        [
          {
            :@x_AssociatedLoanAccount => "id9005"
          }
        ],
        {
          :@Amount => 9999.99
        }
      ])
    end
  end

  describe '#insurance_associated_accounts' do
    let(:params) {
      [
        {
          "associated_loan_account": "id9005"
        },
        {
          "associated_loan_account": "id9005"
        }
      ]
    }
    let(:response) { subject.insurance_associated_accounts(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@x_AssociatedLoanAccount
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        "id9005"
      ])
    end
  end

  describe "#liabilities" do
    let(:params) {
      [
        {
          "closing_on_settlement": "Yes",
          "clearing_from_this_loan": "Yes",
          "outstanding_balance": 20000,
          "type": "Amortising Home Loan",
          "percent_owned": {
            "owners": [
              {
                "party": "id9006"
              }
            ]
          }
        },
        {
          "closing_on_settlement": "Yes",
          "clearing_from_this_loan": "Yes",
          "outstanding_balance": 20000,
          "type": "Amortising Home Loan",
          "percent_owned": {
            "owners": [
              {
                "party": "id9006"
              }
            ]
          }
        }
      ]
    }
    let(:response) { subject.liabilities(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@ClosingOnSettlement,
        :@ClearingFromThisLoan,
        :@OutstandingBalance,
        :@Type,
        :PercentOwned
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        "Yes",
        "Yes",
        20000,
        "Amortising Home Loan",
        {
          :Owner => [
            {
              :@x_Party => "id9006"
            }
          ]
        }
      ])
    end
  end

  describe "#liability_owners" do
    let(:params) {
      [
        {
          "party": "id9006"
        },
        {
          "party": "id9007"
        }
      ]
    }
    let(:response) { subject.liability_owners(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@x_Party
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        "id9006"
      ])
    end

    it "returns the correct values" do
      expect(response.last.values).to eq([
        "id9007"
      ])
    end
  end

  describe "#loan_details" do
    let(:params) {
      [
        {
          "amount_requested": 500000,
          "estimated_settlement_date": "2020-05-13",
          "funder": "Loanworks",
          "loan_type": "Amortising Home Loan",
          "main_product": "Yes",
          "product_code": "ILMCICPM",
          "product_name": "Term Loan Variable Interest",
          "secured": "Yes",
          "tax_deductible": "No",
          "unique_id": "id9005",
          "borrowers": {
            "proportions": "Equal",
            "owners": [
              {
                "party": "id9006"
              },
              {
                "party": "id9007"
              }
            ]
          },
          "discount_margins": [
            {
              "discount_rate": 0.99,
              "discount_reason": "Honeymoon Rate",
              "duration": 12,
              "duration_units": "Months"
            }
          ],
          "documentation_instructions": {
            "method": "Email",
            "send_documents_to": "All"
          },
          "features_selected": {
            "rate_lock": "No",
            "offset_accounts": [
              {
                "is_existing": "No"
              }
            ]
          },
          "lending_purposes": [
            {
              "abs_lending_purpose_code": "ABS-129",
              "purpose_amount": 450000
            }
          ],
          "loan_purpose": {
            "nccp_status": "Regulated",
            "primary_purpose": "Owner Occupied"
          },
          "proposed_repayment": {
            "anniversary_date": "2017-08-07",
            "regular": "Yes",
            "regular_repayments": [
              {
                "amount": 3107.92,
                "frequency": "Monthly",
                "last_repayment_date": "2024-08-23",
                "total_repayments": 300
              }
            ],
            "structured_payments": {
              "payments": [
                {
                  "amount": 3095.62,
                  "sequence_number": 1
                }
              ]
            }
          },
          "rate_compositions": [
            {
              "unique_id": "ID0777",
              "base_rate": {
                "name": "Annual Variable Rate",
                "rate": 3.79
              }
            }
          ],
          "securities": [
            {
              "priority": "Registered Security",
              "security": "id9009"
            }
          ],
          "term": {
            "interest_type": "Variable",
            "interest_type_duration": 300,
            "interest_type_units": "Months",
            "payment_type": "Interest Partially Capitalised",
            "payment_type_duration": 299,
            "payment_type_units": "Months",
            "total_interest_amount": 15850,
            "total_term_duration": 25,
            "total_term_type": "Total Term",
            "total_term_units": "Years",
            "distinct_loan_periods": [
              {
                "rate_composition": "ID0777"
              }
            ]
          }
        }
      ]
    }
    let(:response) { subject.loan_details(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns the correct keys" do
      expect(response.first.keys).to eq([
        :@AmountRequested,
        :@EstimatedSettlementDate,
        :@Funder,
        :@LoanType,
        :@MainProduct,
        :@ProductCode,
        :@ProductName,
        :@Secured,
        :@TaxDeductible,
        :@UniqueID,
        :Borrowers,
        :DiscountMargin,
        :DocumentationInstructions,
        :FeaturesSelected,
        :LendingPurpose,
        :LoanPurpose,
        :ProposedRepayment,
        :RateComposition,
        :Security,
        :Term
      ])
    end

    it "returns the correct values" do
      expect(response.first.values).to eq([
        500000,
        "2020-05-13",
        "Loanworks",
        "Amortising Home Loan",
        "Yes",
        "ILMCICPM",
        "Term Loan Variable Interest",
        "Yes",
        "No",
        "id9005",
        {
          :@Proportions => "Equal",
          :Owner => [
            {
              :@x_Party => "id9006"
            },
            {
              :@x_Party => "id9007"
            }
          ]
        },
        [
          {
            :@DiscountRate => 0.99,
            :@DiscountReason => "Honeymoon Rate",
            :@Duration => 12,
            :@DurationUnits => "Months"
          }
        ],
        {
          :@Method => "Email",
          :@SendDocumentsTo => "All"
        },
        {
          :@RateLock => "No",
          :OffsetAccount => [
            {
              :@IsExisting => "No"
            }
          ]
        },
        [
          {
            :@ABSLendingPurposeCode => "ABS-129",
            :@PurposeAmount => 450000
          }
        ],
        {
          :@NCCPStatus => "Regulated",
          :@PrimaryPurpose => "Owner Occupied"
        },
        {
          :@AnniversaryDate => "2017-08-07",
          :@Regular => "Yes",
          :RegularRepayment =>
          [
            {
              :@Amount => 3107.92,
              :@Frequency => "Monthly",
              :@LastRepaymentDate => "2024-08-23",
              :@TotalRepayments => 300
            }
          ],
          :StructuredPayments =>
          {
            :Payment => [
              {
                :@Amount => 3095.62,
                :@SequenceNumber => 1
              }
            ]
          }
        },
        [
          {
            :@UniqueID => "ID0777",
            :BaseRate => {
              :@Name => "Annual Variable Rate",
              :@Rate => 3.79
            }
          }
        ],
        [
          {
            :@Priority => "Registered Security",
            :@x_Security => "id9009"
          }
        ],
        {
          :@InterestType => "Variable",
          :@InterestTypeDuration => 300,
          :@InterestTypeUnits => "Months",
          :@PaymentType => "Interest Partially Capitalised",
          :@PaymentTypeDuration => 299,
          :@PaymentTypeUnits => "Months",
          :@TotalInterestAmount => 15850,
          :@TotalTermDuration => 25,
          :@TotalTermType => "Total Term",
          :@TotalTermUnits => "Years",
          :DistinctLoanPeriod => [
            {
              :@x_RateComposition => "ID0777"
            }
          ]
        }
      ])
    end
  end

  describe "#borrower_owners" do
    let(:params) {
      [
        {
          "party": "id9006"
        },
        {
          "party": "id9007"
        }
      ]
    }
    let(:response) { subject.borrower_owners(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([:@x_Party])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq(["id9006"])
    end
  end

  describe "#discount_margins" do
    let(:params) {
      [
        {
          "discount_rate": 0.99,
          "discount_reason": "Honeymoon Rate",
          "duration": 12,
          "duration_units": "Months"
        },
        {
          "discount_rate": 0.99,
          "discount_reason": "Honeymoon Rate",
          "duration": 12,
          "duration_units": "Months"
        }
      ]
    }
    let(:response) { subject.discount_margins(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@DiscountRate,
        :@DiscountReason,
        :@Duration,
        :@DurationUnits
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        0.99,
        "Honeymoon Rate",
        12,
        "Months"
      ])
    end
  end

  describe "#offset_accounts" do
    let(:params) {
      [
        {
          "is_existing": "No"
        },
        {
          "is_existing": "Yes"
        }
      ]
    }
    let(:response) { subject.offset_accounts(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([:@IsExisting])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq(["No"])
    end
  end

  describe "#lending_purposes" do
    let(:params) {
      [
        {
          "abs_lending_purpose_code": "ABS-129",
          "purpose_amount": 450000
        },
        {
          "abs_lending_purpose_code": "ABS-130",
          "purpose_amount": 450001
        }
      ]
    }
    let(:response) { subject.lending_purposes(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@ABSLendingPurposeCode,
        :@PurposeAmount
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "ABS-129",
        450000
      ])
    end
  end

  describe "#regular_repayments" do
    let(:params) {
      [
        {
          "amount": 3107.92,
          "frequency": "Monthly",
          "last_repayment_date": "2024-08-23",
          "total_repayments": 300
        },
        {
          "amount": 3107.92,
          "frequency": "Monthly",
          "last_repayment_date": "2024-08-23",
          "total_repayments": 300
        }
      ]
    }
    let(:response) { subject.regular_repayments(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Amount,
        :@Frequency,
        :@LastRepaymentDate,
        :@TotalRepayments
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        3107.92,
        "Monthly",
        "2024-08-23",
        300
      ])
    end
  end

  describe "#structured_payments" do
    let(:params) {
      [
        {
          "amount": 3095.62,
          "sequence_number": 1
        },
        {
          "amount": 3095.62,
          "sequence_number": 2
        }
      ]
    }
    let(:response) { subject.structured_payments(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Amount,
        :@SequenceNumber
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        3095.62,
        1
      ])
    end
  end

  describe "#rate_compositions" do
    let(:params) {
      [
        {
          "unique_id": "ID0777",
          "base_rate": {
            "name": "Annual Variable Rate",
            "rate": 3.79
          }
        },
        {
          "unique_id": "ID0778",
          "base_rate": {
            "name": "Annual Variable Rate",
            "rate": 3.79
          }
        }
      ]
    }
    let(:response) { subject.rate_compositions(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@UniqueID,
        :BaseRate
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "ID0777",
        {
          :@Name => "Annual Variable Rate",
          :@Rate => 3.79
        }
      ])
    end
  end

  describe "#securities" do
    let(:params) {
      [
        {
          "priority": "Registered Security",
          "security": "id9009"
        },
        {
          "priority": "Registered Security",
          "security": "id9010"
        }
      ]
    }
    let(:response) { subject.securities(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Priority,
        :@x_Security
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "Registered Security",
        "id9009"
      ])
    end
  end

  describe "#distinct_loan_periods" do
    let(:params) {
      [
        {
          "rate_composition": "ID0777"
        },
        {
          "rate_composition": "ID0888"
        }
      ]
    }
    let(:response) { subject.distinct_loan_periods(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([:@x_RateComposition])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq(["ID0777"])
    end
  end

  describe "#non_real_estate_assets" do
    let(:params) {
      [
        {
          "asset_reference_number": 522658,
          "transaction": "Transfer",
          "type": "Financial Asset",
          "unique_id": "NREA-001",
          "estimated_value": {
            "estimate_basis": "Applicant Estimate",
            "value": 4000000
          },
          "financial_asset": {
            "account_number": {
              "financial_institution": "Infinity Group Finance Pty Ltd"
            }
          }
        },
        {
          "asset_reference_number": 522659,
          "transaction": "Transfer",
          "type": "Financial Asset",
          "unique_id": "NREA-002",
          "estimated_value": {
            "estimate_basis": "Applicant Estimate",
            "value": 4000000
          },
          "financial_asset": {
            "account_number": {
              "financial_institution": "Infinity Group Finance Pty Ltd"
            }
          }
        }
      ]
    }
    let(:response) { subject.non_real_estate_assets(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@AssetReferenceNumber,
        :@Transaction,
        :@Type,
        :@UniqueID,
        :EstimatedValue
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "522658",
        "Transfer",
        "Financial Asset",
        "NREA-001",
        {
          :@EstimateBasis => "Applicant Estimate",
          :@Value => 4000000
        }
      ])
    end
  end

  describe "#person_applicants" do
    let(:params) {
      [
        {
          "applicant_type": "Borrower",
          "citizenship": "AU",
          "first_home_buyer": "No",
          "gender": "Male",
          "independent_financial_advice": "Yes",
          "independent_financial_advice_requirement": "Recommended",
          "is_existing_customer": "No",
          "marital_status": "Single",
          "primary_applicant": "Yes",
          "residency_status": "Permanently in Australia",
          "unique_id": "id9006",
          "contact": {
            "current_address": {
              "housing_status": "Own Home",
              "mailing_address": "id9002",
              "residential_address": "id9002"
            },
            "email_addresses": [
              {
                "email": "ohunt@cruz.com",
                "email_type": "Home"
              }
            ],
            "mobile": {
              "country_code": 61,
              "number": 8441241769
            }
          },
          "employments": [
            {
              "payg": {
                "occupation": "Education, health or welfare services professional",
                "status": "Primary",
                "income": {
                  "gross_salary_amount": 50000,
                  "gross_salary_frequency": "Yearly",
                  "proof_code": "Payslip",
                  "proof_sighted": "Yes"
                }
              }
            }
          ],
          "person_name": {
            "first_name": "Brent",
            "middle_names": "Rick",
            "name_title": "Mr",
            "surname": "Luna"
          },
          "privacy": {
            "allow_credit_check": "Yes",
            "credit_authority_signed": "Yes",
            "privacy_act_consent_signed": "Yes"
          },
          "proof_of_identities": [
            {
              "document_number": "ES12456",
              "document_type": "ImmiCard",
              "issuing_organisation": "ZIPID"
            }
          ]
        },
        {
          "applicant_type": "Borrower",
          "citizenship": "AU",
          "first_home_buyer": "No",
          "gender": "Female",
          "independent_financial_advice": "No",
          "independent_financial_advice_requirement": "Not Required",
          "is_existing_customer": "No",
          "marital_status": "Single",
          "primary_applicant": "No",
          "residency_status": "Permanently in Australia",
          "unique_id": "id9007",
          "contact": {
            "current_address": {
              "housing_status": "Own Home",
              "mailing_address": "id9002",
              "residential_address": "id9002"
            },
            "email_addresses": [
              {
                "email": "jmcgee@hahn.net",
                "email_type": "Home"
              }
            ],
            "mobile": {
              "country_code": 61,
              "number": 4134520920
            }
          },
          "employments": [
            {
              "payg": {
                "occupation": "Education, health or welfare services professional",
                "status": "Primary",
                "unique_id": "id9008",
                "income": {
                  "gross_salary_amount": 50000,
                  "gross_salary_frequency": "Yearly",
                  "proof_code": "Payslip",
                  "proof_sighted": "Yes"
                }
              }
            }
          ],
          "person_name": {
            "first_name": "Katherine",
            "middle_names": "Erin",
            "name_title": "Ms",
            "surname": "Jordan"
          },
          "privacy": {
            "allow_credit_check": "Yes",
            "credit_authority_signed": "Yes",
            "privacy_act_consent_signed": "Yes"
          },
          "proof_of_identities": [
            {
              "issuing_organisation": "ZIPID"
            }
          ]
        }
      ]
    }

    let(:response) { subject.person_applicants(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@ApplicantType,
        :@Citizenship,
        :@FirstHomeBuyer,
        :@Gender,
        :@IndependentFinancialAdvice,
        :@IndependentFinancialAdviceRequirement,
        :@IsExistingCustomer,
        :@MaritalStatus,
        :@PrimaryApplicant,
        :@ResidencyStatus,
        :@UniqueID,
        :Contact,
        :Employment,
        :PersonName,
        :Privacy,
        :ProofOfIdentity
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq(["Borrower",
        "AU",
        "No",
        "Male",
        "Yes",
        "Recommended",
        "No",
        "Single",
        "Yes",
        "Permanently in Australia",
        "id9006",
        {
          :CurrentAddress => {
            :@HousingStatus => "Own Home",
            :@x_MailingAddress => "id9002",
            :@x_ResidentialAddress => "id9002"
          },
          :EmailAddress => [
            {
              :@Email => "ohunt@cruz.com",
              :@EmailType => "Home"
            }
          ],
         :Mobile => {
          :@CountryCode => "61",
          :@Number => 8441241769
          }
        },
        [{
          :PAYG => {
            :@Occupation => "Education, health or welfare services professional",
            :@Status => "Primary",
            :Income => {
              :@GrossSalaryAmount => 50000,
              :@GrossSalaryFrequency => "Yearly"
            }
          }
        }],
        {
          :@FirstName => "Brent",
          :@NameTitle => "Mr",
          :@Surname => "Luna"
        },
        {
          :@AllowCreditCheck => "Yes",
          :@CreditAuthoritySigned => "Yes",
          :@PrivacyActConsentSigned => "Yes"},
        [{
          :@DocumentNumber => "ES12456",
          :@DocumentType => "ImmiCard",
          :@IssuingOrganisation => "ZIPID"
        }]
      ])
    end
  end

  describe "#email_addresses" do
    let(:params) {
      [
        {
          "email": "test1@test.com",
          "email_type": "Home"
        },
        {
          "email": "test2@test.com",
          "email_type": "Work"
        }
      ]
    }
    let(:response) { subject.email_addresses(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Email,
        :@EmailType
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "test1@test.com",
        "Home"
      ])
    end
  end

  describe "#employments" do
    let(:params) {
      [
        {
          "payg": {
            "occupation": "Education, health or welfare services professional",
            "status": "Primary",
            "income": {
              "gross_salary_amount": 50000,
              "gross_salary_frequency": "Yearly",
              "proof_code": "Payslip",
              "proof_sighted": "Yes"
            }
          }
        },
        {
          "payg": {
            "occupation": "Education, health or welfare services professional",
            "status": "Primary",
            "income": {
              "gross_salary_amount": 50000,
              "gross_salary_frequency": "Yearly",
              "proof_code": "Payslip",
              "proof_sighted": "Yes"
            }
          }
        }
      ]
    }
    let(:response) { subject.employments(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hash" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([:PAYG])
      expect(response.first[:PAYG].keys).to eq([:@Occupation, :@Status, :Income])
      expect(response.first[:PAYG][:Income].keys).to eq([
        :@GrossSalaryAmount,
        :@GrossSalaryFrequency
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        {
          :@Occupation => "Education, health or welfare services professional",
          :@Status => "Primary",
          :Income => {
            :@GrossSalaryAmount => 50000,
            :@GrossSalaryFrequency => "Yearly"
          }
        }
      ])
    end
  end

  describe "#proof_of_identities" do
    let(:params) {
      [
        {
          "document_number": "ES12456",
          "document_type": "ImmiCard",
          "issuing_organisation": "ZIPID"
        },
        {
          "document_number": "ES12456",
          "document_type": "ImmiCard",
          "issuing_organisation": "ZIPID"
        }
      ]
    }
    let(:response) { subject.proof_of_identities(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@DocumentNumber,
        :@DocumentType,
        :@IssuingOrganisation
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "ES12456",
        "ImmiCard",
        "ZIPID"
      ])
    end
  end

  describe "#real_estate_assets" do
    let(:params) {
      [
        {
          "construction": "No",
          "primary_usage": "Commercial",
          "property_id": "lender_property_ID",
          "to_be_used_as_security": "Yes",
          "transaction": "Purchasing",
          "unique_id": "id9009",
          "address": "id9003",
          "commercial": {
            "type": "Retail"
          },
          "contract_details": {
            "contract_price_amount": 890000
          },
          "encumbrances": [
            {
              "description": "A Mortgage",
              "encumbrance_type": "Mortgage",
              "registered_number": 456456456,
              "in_favour_ofs": [
                {
                  "name": "Commonwealth Bank of Australia"
                }
              ]
            }
          ],
          "insurances": [
            {
              "insurance": "id9004"
            }
          ],
          "percent_owned": {
            "proportions": "Equal",
            "owners": [
              {
                "party": "id9006"
              },
              {
                "party": "id9007"
              }
            ]
          },
          "titles": [
            {
              "duplicate_title_issued": "No",
              "lot": 15,
              "plan": 222741,
              "plan_type": "Deposited Plan",
              "title_reference": "15/222741"
            }
          ]
        }
      ]
    }
    let(:response) { subject.real_estate_assets(params) }

    it "returns a array of real estate assets" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns a hash with the correct keys" do
      expect(response.first.keys).to eq([
        :@Construction,
        :@PrimaryUsage,
        :@PropertyID,
        :@ToBeUsedAsSecurity,
        :@Transaction,
        :@UniqueID,
        :ContractDetails,
        :Encumbrance,
        :Insurance,
        :PercentOwned,
        :Title
      ])
    end

    it "returns a hash with the correct values" do
      expect(response.first.values).to eq([
        "No",
        "Commercial",
        "lender_property_ID",
        "Yes",
        "Purchasing",
        "id9009",
        {
          :@ContractPriceAmount => 890000
        },
        [
          {
            :@Description => "A Mortgage",
            :@EncumbranceType => "Mortgage",
            :@RegisteredNumber => 456456456,
            :InFavourOf => [{
              :@Name => "Commonwealth Bank of Australia"
            }]
          }
        ],
        [
          {
            :@x_Insurance => "id9004"
          }
        ],
        {
          :@Proportions => "Equal",
          :Owner => [
            {
              :@x_Party => "id9006"
            },
            {
              :@x_Party => "id9007"
            }
          ]
        },
        [
          {
            :@DuplicateTitleIssued => "No",
            :@Lot => 15,
            :@Plan => 222741,
            :@PlanType => "Deposited Plan",
            :@TitleReference => "15/222741"
          }
        ]
      ])
    end
  end

  describe "#related_people" do
    let(:params) {
      [
        {
          "unique_id": "RP-005"
        },
        {
          "unique_id": "RP-006"
        }
      ]
    }
    let(:response) { subject.related_people(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@UniqueID
      ])
    end
  end

  describe "#commissions" do
    let(:params) {
      [
        {
          "trail": 1.2
        },
        {
          "trail": 1.3
        }
      ]
    }
    let(:response) { subject.commissions(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Trail
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        1.2
      ])
    end
  end

  describe "#encumbrances" do
    let(:params) {
      [
        {
          "description": "A Mortgage",
          "encumbrance_type": "Mortgage",
          "registered_number": 456456456,
          "in_favour_ofs": [
            {
              "name": "Commonwealth Bank of Australia"
            }
          ]
        },
        {
          "description": "A Mortgage",
          "encumbrance_type": "Mortgage",
          "registered_number": 456456456,
          "in_favour_ofs": [
            {
              "name": "Commonwealth Bank of Australia"
            }
          ]
        }
      ]
    }
    let(:response) { subject.encumbrances(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Description,
        :@EncumbranceType,
        :@RegisteredNumber,
        :InFavourOf
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "A Mortgage",
        "Mortgage",
        456456456,
        [
          {
            :@Name => "Commonwealth Bank of Australia"
          }
        ]
      ])
    end
  end

  describe "#in_favour_ofs" do
    let(:params) {
      [
        {
          "name": "Commonwealth Bank of Australia"
        },
        {
          "name": "Commonwealth Bank of Australia"
        }
      ]
    }
    let(:response) { subject.in_favour_ofs(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Name
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "Commonwealth Bank of Australia"
      ])
    end
  end

  describe "#real_estate_insurances" do
    let(:params) {
      [
        {
          "insurance": "id9003"
        },
        {
          "insurance": "id9004"
        }
      ]
    }
    let(:response) { subject.real_estate_insurances(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@x_Insurance
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "id9003"
      ])
    end
  end

  describe "#owners" do
    let(:params) {
      [
        {
          "party": "id9006"
        },
        {
          "party": "id9007"
        }
      ]
    }
    let(:response) { subject.owners(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@x_Party
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "id9006"
      ])
    end
  end

  describe "#titles" do
    let(:params) {
      [
        {
          "duplicate_title_issued": "No",
          "lot": 15,
          "plan": 222741,
          "plan_type": "Deposited Plan",
          "title_reference": "15/222741"
        },
        {
          "duplicate_title_issued": "No",
          "lot": 15,
          "plan": 222741,
          "plan_type": "Deposited Plan",
          "title_reference": "15/222741"
        }
      ]
    }
    let(:response) { subject.titles(params) }

    it "returns an array" do
      expect(response).to be_an(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@DuplicateTitleIssued,
        :@Lot,
        :@Plan,
        :@PlanType,
        :@TitleReference
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "No",
        15,
        222741,
        "Deposited Plan",
        "15/222741"
      ])
    end
  end

  describe "#fees" do
    let(:params) {
      [
        {
          "amount": 20,
          "description": "Monthly Service Fee",
          "frequency": "Monthly",
          "pay_fees_from": "Account",
          "payable_to": "LIXIBank",
          "type": "Loan Fee"
        },
        {
          "amount": 1000,
          "description": "Discharge Administration Fee",
          "frequency": "One Off",
          "pay_fees_from": "Account",
          "payable_to": "LIXIBank",
          "type": "Loan Fee"
        }
      ]
    }
    let(:response) { subject.fees(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns a array of 2 hashes" do
      expect(response.size).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq(
        [
          :@Amount,
          :@Description,
          :@Frequency,
          :@PayFeesFrom,
          :@Type
        ]
      )
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq(
        [
          20,
          "Monthly Service Fee",
          "Monthly",
          "Account",
          "Loan Fee"
        ]
      )
    end
  end

  describe "#instructions" do
    let(:params) {
      {
        "documents_and_settlement_instructions": {
          "submit": {
            "type": "Loan Documents Request",
            "conditions": [
              {
                "condition_code": 4412,
                "condition_owner": "Loan Officer",
                "condition_status": "Not Satisfied",
                "created_date_time": "2020-01-07T08:46:40",
                "doc_requirement": "No",
                "precondition_to_stage": "Conditional Approval",
                "updated_date_time": "2020-03-23T08:46:40"
              }
            ],
            "generate_documents": [
              {
                "delivery_type": "Email",
                "document_name": "Loan Contract",
                "context": {
                  "type": "Loan Account",
                  "context": "id9005"
                }
              }
            ]
          }
        }
      }
    }
    let(:response) { subject.instructions(params)}
    let(:documents_and_settlement_instructions) { response[:DocumentsAndSettlementInstructions] }
    let(:submit) { documents_and_settlement_instructions[:Submit] }

    it "returns a hash" do
      expect(response).to be_a(Hash)
    end

    it "returns a hash with the correct keys" do
      expect(response.keys).to eq([:DocumentsAndSettlementInstructions])
    end

    it "returns the correct keys for DocumentsAndSettlementInstructions" do
      expect(documents_and_settlement_instructions.keys).to eq([:Submit])
    end

    it "returns the correct keys for Submit" do
      expect(submit.keys).to eq(
        [
          :@Type,
          :Condition,
          :GenerateDocument
        ]
      )
    end

    it "returns the correct keys for Condition" do
      expect(submit[:Condition].first.keys).to eq(
        [
          :@ConditionCode,
          :@ConditionOwner,
          :@ConditionStatus,
          :@CreatedDateTime,
          :@DocRequirement,
          :@PreconditionToStage,
          :@UpdatedDateTime
        ]
      )
    end

    it "returns the correct keys for GenerateDocument" do
      expect(submit[:GenerateDocument].first.keys).to eq(
        [
          :@DeliveryType,
          :@DocumentName,
          :Context
        ]
      )
    end
  end

  describe "#instruction_conditions" do
    let(:params) {
      [
        {
          "condition_code": 4412,
          "condition_owner": "Loan Officer",
          "condition_status": "Not Satisfied",
          "created_date_time": "2020-01-07T08:46:40",
          "doc_requirement": "No",
          "precondition_to_stage": "Conditional Approval",
          "updated_date_time": "2020-03-23T08:46:40"
        },
        {
          "condition_code": 4413,
          "condition_owner": "Loan Officer",
          "condition_status": "Not Satisfied",
          "created_date_time": "2020-01-07T08:46:40",
          "doc_requirement": "No",
          "precondition_to_stage": "Conditional Approval",
          "updated_date_time": "2020-03-23T08:46:40"
        }
      ]
    }
    let(:response) { subject.instruction_conditions(params) }

    it "returns a array" do
      expect(response).to be_a(Array)
    end

    it "returns a array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns a array of 2 hashes" do
      expect(response.count).to eq(2)
    end

    it "returns a array of hashes with correct keys" do
      expect(response.first.keys).to eq(
        [
          :@ConditionCode,
          :@ConditionOwner,
          :@ConditionStatus,
          :@CreatedDateTime,
          :@DocRequirement,
          :@PreconditionToStage,
          :@UpdatedDateTime
        ]
      )
    end

    it "returns a array of hashes with correct values" do
      expect(response.first.values).to eq(
        [
          4412,
          "Loan Officer",
          "Not Satisfied",
          "2020-01-07T08:46:40",
          "No",
          "Conditional Approval",
          "2020-03-23T08:46:40"
        ]
      )
    end
  end

  describe "#instruction_generated_documents" do
    let(:params) {
      [
        {
          "delivery_type": "Email",
          "document_name": "Loan Contract",
          "context": {
            "type": "Loan Account",
            "context": "id9005"
          }
        },
        {
          "delivery_type": "Email",
          "document_name": "Loan Contract",
          "context": {
            "type": "Loan Account",
            "context": "id9006"
          }
        }
      ]
    }
    let(:response) { subject.instruction_generated_documents(params) }

    it "returns a array" do
      expect(response).to be_a(Array)
    end

    it "returns a array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns a array of 2 hashes" do
      expect(response.length).to eq(2)
    end

    it "returns a array of hashes with the correct keys" do
      expect(response.first.keys).to eq(
        [
          :@DeliveryType,
          :@DocumentName,
          :Context
        ]
      )
    end

    it "returns a array of hashes with the correct values" do
      expect(response.first.values).to eq(
        [
          "Email",
          "Loan Contract",
          {
            :@Type => "Loan Account",
            :@x_Context => "id9005"
          }
        ]
      )
    end
  end

  describe "#recipients" do
    let(:params) {
      [
        {
          "description": "A description of the system.",
          "lixi_code": "LIXILIXI"
        },
        {
          "description": "A description of the system.",
          "lixi_code": "LIXILIXI"
        }
      ]
    }
    let(:response) { subject.recipients(params) }

    it "returns an array" do
      expect(response).to be_a(Array)
    end

    it "returns an array of hashes" do
      expect(response.first).to be_a(Hash)
    end

    it "returns an array of 2 hashes" do
      expect(response.size).to eq(2)
    end

    it "returns an array of hashes with the correct keys" do
      expect(response.first.keys).to eq([
        :@Description,
        :@LIXICode
      ])
    end

    it "returns an array of hashes with the correct values" do
      expect(response.first.values).to eq([
        "A description of the system.",
        "LIXILIXI"
      ])
    end
  end

  describe "#production_data" do
    it "returns a string" do
      expect(subject.production_data()).to be_a(String)
    end

    it "returns No if production is false" do
      subject.instance_variable_set(:@production, false)
      expect(subject.production_data()).to eq("No")
    end

    it "returns Yes if production is true" do
      subject.instance_variable_set(:@production, true)
      expect(subject.production_data()).to eq("Yes")
    end
  end
end
