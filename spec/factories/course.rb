FactoryGirl.define do
  factory :course do
    title 'Sample Course'
    association :school
    description 'Donec rutrum congue leo eget malesuada.'
    content <<-content
    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.
    Vivamus suscipit tortor eget felis porttitor volutpat.
    Quisque velit nisi, pretium ut lacinia in, elementum id enim.
    content
    duration 16
    creation_date Date.new
    active_students 100
    price 100.00
  end

  factory :invalid_course, class: Course do
    title ''
    description ''
    content ''
    duration ''
    creation_date ''
    active_students ''
    price ''
  end
end
