FactoryBot.define do
  factory :profile do
    family_name            {"名前"}
    first_name             {"名前"}
    family_name_kana        {"なまえ"}
    first_name_kana        {"なまえ"}
    post_code              {"0000000"}
    city                   {"市区町村"}
    address_number         {"123456"}
    building               {"ビル名"}
    phone                  {"00000000000"}
  end
end