FactoryGirl.define do
  factory :school do
    name 'Sample School of Technology'
    email 'contact@ssoftech.com'
    pitch <<-pitch
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
      incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
      xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    pitch
    subdomain 'ssoftech'
    creation_date Date.new
  end

  factory :invalid_school, class: School do
    name ''
    email ''
    pitch ''
    subdomain ''
    creation_date ''
  end
end
