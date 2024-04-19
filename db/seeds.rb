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
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shortcake2.jpg"), filename: "shortcake2.jpg")
  item.genre_id = "1"
  item.name = "ショートケーキ"
  item.introduction = "素材にこだわって作りました！特別な日に食べたいショートケーキです。"
  item.price = "680"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "ベリーケーキ") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/berrycake.jpg"), filename: "berrycake.jpg")
  item.genre_id = "1"
  item.name = "ベリーケーキ"
  item.introduction = "甘酸っぱいベリーを乗せたこだわりのベリーケーキです！至福の時間をあなたへ...！"
  item.price = "720"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "なめらかプリン") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/standerdprin.jpg"), filename: "standerdprin.jpg")
  item.genre_id = "2"
  item.name = "なめらかプリン"
  item.introduction = "口の中でとろける至福の食感をご堪能ください！"
  item.price = "280"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "ベリープリン") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/berrypurin.jpg"), filename: "berrypurin.jpg")
  item.genre_id = "2"
  item.name = "ベリープリン"
  item.introduction = "ベリーとプリンの絶妙なマッチ！優雅なティータイムのお供に♪"
  item.price = "320"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "えいごクッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/english.jpg"), filename: "english.jpg")
  item.genre_id = "3"
  item.name = "えいごクッキー"
  item.introduction = "アルファベットの形をしたクッキーです！クッキーでメッセージを作れるかも！？"
  item.price = "120"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "おかおクッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/face.jpg"), filename: "face.jpg")
  item.genre_id = "3"
  item.name = "おかおクッキー"
  item.introduction = "おかおの形をしたクッキーです！中にはチョコ入り。ブレイクタイムにピッタリ♪"
  item.price = "130"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "バレンタインクッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/varentine.jpg"), filename: "varentine.jpg")
  item.genre_id = "3"
  item.name = "バレンタインクッキー"
  item.introduction = "迫るバレンタイン！気になるあの子へ渡してみて...！"
  item.price = "130"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "カカオマフィン") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mafin.jpg"), filename: "mafin.jpg")
  item.genre_id = "4"
  item.name = "カカオマフィン"
  item.introduction = "ビターなカカオマフィンです！紅茶と一緒にどうぞ♪"
  item.price = "480"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "至極のパンケーキ") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pancake.jpg"), filename: "pancake.jpg")
  item.genre_id = "4"
  item.name = "至極のパンケーキ"
  item.introduction = "こだわりぬいたパンケーキです！自分へのご褒美に...♪"
  item.price = "420"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "チョコマフィン") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/chocomafin.jpg"), filename: "chocomafin.jpg")
  item.genre_id = "4"
  item.name = "チョコマフィン"
  item.introduction = "とろける甘さのチョコマフィンです！おやつにピッタリ！"
  item.price = "420"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "お正月クッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/syougatu.jpg"), filename: "syougatu.jpg")
  item.genre_id = "3"
  item.name = "お正月クッキー"
  item.introduction = "今年も一年宜しくお願い致します！たくさんの幸福が訪れますように！"
  item.price = "120"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "ひなまつりクッキー") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hinamaturi.jpg"), filename: "hinamaturi.jpg")
  item.genre_id = "3"
  item.name = "ひなまつりクッキー"
  item.introduction = "可愛いひなまつりクッキーです！食べるのがもったいないかも！？"
  item.price = "120"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "マカロン5個セット") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/macaron5.jpg"), filename: "macaron5.jpg")
  item.genre_id = "4"
  item.name = "マカロン5個セット"
  item.introduction = "マカロン5個セットです！たくさん並べると可愛さ満点♪"
  item.price = "230"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "ナッツケーキ") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/natsucake.jpg"), filename: "natsucake.jpg")
  item.genre_id = "1"
  item.name = "ナッツケーキ"
  item.introduction = "素材にこだわったナッツケーキです！紅茶によく合う♪"
  item.price = "760"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "ベジケーキ") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/vesideco.jpg"), filename: "vesideco.jpg")
  item.genre_id = "1"
  item.name = "ベジケーキ"
  item.introduction = "新感覚！？野菜のケーキができました！ダイエット中のあなたにもご褒美を！"
  item.price = "760"
  item.is_active = "true"
end

Item.find_or_create_by!(name: "満点シュークリーム") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shucream.jpg"), filename: "shucream.jpg")
  item.genre_id = "4"
  item.name = "満点シュークリーム"
  item.introduction = "カスタードたっぷりのシュークリームです！この甘さが堪らない...！！"
  item.price = "350"
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