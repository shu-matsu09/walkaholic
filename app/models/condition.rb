class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '今日の調子を選んでください' },
    { id: 2, name: 'とても調子が良い' },
    { id: 3, name: 'まあまあ調子が良い' },
    { id: 4, name: 'ふつう' },
    { id: 5, name: 'あまり調子がよくない' },
    { id: 6, name: 'ぜんぜん調子がよくない' },
  ]

  include ActiveHash::Associations
  has_many :pedometers

end