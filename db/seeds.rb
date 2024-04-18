# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#customerデータ作成

15.times do |n|
  Customer.create!(
    last_name: "令和#{n + 1}",
    first_name: "道子#{n + 1}",
    last_name_kana: "レイワ#{n + 1}",
    first_name_kana: "ミチコ#{n + 1}",
    email: "sample#{n + 1}@example.com",
    postal_code: "0000000",
    address: "東京都渋谷区代々木神薗町0-0",
    telephone_number: "11111111111",
    password: "password",
    is_active: "true",
  )
end

#addressデータ作成
Address.create!(customer_id: "1", name: "鈴木太郎", address: "東京都新宿区新宿2-5-10成信ビル 4階", postal_code: "4444444")
Address.create!(customer_id: "1", name: "佐藤太郎", address: "大阪府大阪市0-0", postal_code: "5555555")

#adminデータ作成
Admin.create!(
   email: 'admin@admin',
   password: 'password'
)

#genreデータ作成
Genre.create!(name: "ケーキ")
Genre.create!(name: "プリン")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "キャンディ")

#itemデータ作成
Item.find_or_create_by!(name: "ショートケーキ") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item1.jpg"), filename: "sample-item3.jpg")
  item.genre_id = "1"
  item.name = "ショートケーキ"
  item.introduction = "さんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキスト"
  item.price = "3000"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "なめらかプリン") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item2.jpg"), filename: "sample-item2.jpg")
  item.genre_id = "2"
  item.name = "なめらかプリン"
  item.introduction = "さんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキスト"
  item.price = "1600"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "クッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item1.jpg"), filename: "sample-item3.jpg")
  item.genre_id = "3"
  item.name = "クッキー"
  item.introduction = "さんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキスト"
  item.price = "1000"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "りんご飴") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item4.jpg"), filename: "sample-item4.jpg")
  item.genre_id = "4"
  item.name = "りんご飴"
  item.introduction = "さんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキストさんぷるてきすとサンプルテキスト"
  item.price = "2000"
  item.is_active = "true"
end

#cart_itemデータ作成
CartItem.find_or_create_by!(customer_id: "1") do |cart_item|
  cart_item.customer_id = "1"
  cart_item.item_id = "1"
  cart_item.amount = "2"
end

CartItem.find_or_create_by!(customer_id: "1") do |cart_item|
  cart_item.customer_id = "1"
  cart_item.item_id = "2"
  cart_item.amount = "1"
end

CartItem.find_or_create_by!(customer_id: "1") do |cart_item|
  cart_item.customer_id = "1"
  cart_item.item_id = "3"
  cart_item.amount = "3"
end

#orderデータ作成
#order_detailデータ作成