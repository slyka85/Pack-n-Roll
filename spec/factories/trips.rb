FactoryGirl.define do
  factory :trip do
    user

    destination 'New York'
    current_location 'Rio de Janeiro'
    start_date '2000-10-10'
    end_date '2000-11-10'
  end
end
