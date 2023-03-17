FactoryBot.define do
  factory :user do
    trait :buyer do
      role {:buyer}
    end

    trait :seller do
      role {:seller}
    end

		trait :admin do
      role {:admin}
    end
		
  end
end