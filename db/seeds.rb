# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# look.html.erb

GalleryItem.destroy_all

GalleryItem.create!(
  name: 'forest villa',
  description: '大人な空間で、10000冊以上の本が読み放題。ゆったりとした時間をお過ごし頂けます。',
  image_filename: 'img/villa1.jpg',
  category: 'look'
)

GalleryItem.create!(
  name: 'リクライニングベット',
  description: '座り心地の良いソファーで、寛ぎながら読書や仮眠が可能です。',
  image_filename: 'img/villa2.jpg',
  category: 'look'
)

GalleryItem.create!(
  name: 'クールダウンテラス',
  description: '半屋外のテラスで、自然の風で心地よくクールダウンができます。',
  image_filename: 'img/villa3.jpg',
  category: 'look'
)



GalleryItem.create!(
  name: '大汗汗蒸幕（だいかんはんじゅんまく）',
  description: '80℃以上の熱せられた「大汗汗蒸幕」は韓国の伝統あるサウナ!',
  image_filename: 'img/bedrock1.jpg',
  category: 'bedrock'
)

GalleryItem.create!(
  name: 'アロマソルトの間',
  description: '約45℃前後の岩塩によるミネラル分の空気を吸いながら、じっくりと発汗を促します。',
  image_filename: 'img/bedrock2.jpg',
  category: 'bedrock'
)

GalleryItem.create!(
  name: 'アロマザルツの間',
  description: '約40℃前後の部屋で、壁から塩水を流下させた室内は、ミネラル豊富な微細な水蒸気で満たしています。',
  image_filename: 'img/bedrock3.jpg',
  category: 'bedrock'
)

GalleryItem.create!(
  name: '薬宝黄土房',
  description: '約40℃前後の黄土から放射される遠赤外線で、発汗と老廃物の排出を促します。',
  image_filename: 'img/bedrock4.jpg',
  category: 'bedrock'
)

GalleryItem.create!(
  name: 'ブラックゲルマ房',
  description: '約45℃前後で、遠赤外線効果が高いとされるゲルマニウム鉱石を使用してます。',
  image_filename: 'img/bedrock5.jpg',
  category: 'bedrock'
)

GalleryItem.create!(
  name: '美宝石房（びほうせきぼう）',
  description: '約45℃前後の女性専用の岩盤浴エリアで、さまざまな特徴の宝石が敷き詰められています。',
  image_filename: 'img/bedrock6.jpg',
  category: 'bedrock'
)



GalleryItem.create!(
  name: '唐揚げタルタル丼とそばセット',
  description: '唐揚げ丼とそばの二つを同時に楽しめるセットです。',
  image_filename: 'img/ryusenji_food1.jpg',
  category: 'look_food'
)

GalleryItem.create!(
  name: '和風竜田揚げ定食',
  description: 'サクサクの唐揚げと特製小鉢のついた嬉しい定食です。',
  image_filename: 'img/ryusenji_food2.jpg',
  category: 'look_food'
)

GalleryItem.create!(
  name: 'お刺身と天麩羅の花籠膳',
  description: 'お刺身や天ぷらなどたっぷり入った贅沢なセットです。',
  image_filename: 'img/ryusenji_food3.jpg',
  category: 'look_food'
)



GalleryItem.create!(
  name: '高濃度炭酸風呂',
  description: '1200ppm以上の高濃度で、血流を通常（温泉）の4〜7倍に高める「魔法のお風呂」と評される名物風呂です。',
  image_filename: 'img/ryusenji_onsen1.jpg',
  category: 'look_onsen'
)

GalleryItem.create!(
  name: '泡の湯',
  description: '横浜初で、泡でお湯が白く見える、なめらかなお風呂です。',
  image_filename: 'img/ryusenji_onsen2.jpg',
  category: 'look_onsen'
)

GalleryItem.create!(
  name: 'ジェットバス',
  description: '強力なジェット水流で身体のコリをほぐし、シェイプアップをサポートする浴槽です。',
  image_filename: 'img/ryusenji_onsen3.jpg',
  category: 'look_onsen'
)


# see.html.erb

GalleryItem.create!(
  name: '外観',
  description: '豊富なおふろとサウナで、あなたをお出迎えします。',
  image_filename: 'img/ousama.jpg',
  category: 'see'
)

GalleryItem.create!(
  name: 'メニュー表',
  description: '豊富なメニューであなたの心とお腹が満たします。',
  image_filename: 'img/restaurant-menu.jpg',
  category: 'see'
)

GalleryItem.create!(
  name: 'うたた寝の湯',
  description: '寝転びながら温泉でリラックスタイム。',
  image_filename: 'img/utatane.jpg',
  category: 'see'
)



GalleryItem.create!(
  name: '厚切り！熟成とんかつ定食',
  description: '熟成にこだわった豚肉を厚切り豚カツにしたおすすめの逸品です。',
  image_filename: 'img/king_food1.jpg',
  category: 'see_food'
)

GalleryItem.create!(
  name: '天ぷらお刺身定食',
  description: 'サクサクの揚げたて天ぷらにお刺身を付けた人気メニューです。',
  image_filename: 'img/king_food2.jpg',
  category: 'see_food'
)

GalleryItem.create!(
  name: '海老天そば・うどん',
  description: '大きいエビの天ぷらをそば・うどんと一緒に！',
  image_filename: 'img/king_food3.jpg',
  category: 'see_food'
)



GalleryItem.create!(
  name: 'なごみの湯(炭酸泉天然温泉)',
  description: '温泉の成分が炭酸と調和した温泉炭酸泉で贅沢なひとときを',
  image_filename: 'img/innerbath1.jpg',
  category: 'see_onsen'
)

GalleryItem.create!(
  name: 'ぬくもりの湯(天然温泉)',
  description: '露天の源泉かけ流し風呂、展望風呂など23種類もの多彩なお湯を楽しめます。',
  image_filename: 'img/nukumori.jpg',
  category: 'see_onsen'
)

GalleryItem.create!(
  name: 'まどかの湯(天然温泉)',
  description: '「まどか（円か）」という名前の通り、丸い形をしたお風呂です。',
  image_filename: 'img/madoka.jpg',
  category: 'see_onsen'
)


# saw.html.erb

GalleryItem.create!(
  name: '外観（夜）',
  description: '横浜の好立地にある、こちらは24時間楽しめます。',
  image_filename: 'img/manyou.jpg',
  category: 'saw'
)

GalleryItem.create!(
  name: '館内（浴衣）',
  description: '清潔感ある館内には豊富な浴衣があります。',
  image_filename: 'img/manyou_kannai.jpg',
  category: 'saw'
)

GalleryItem.create!(
  name: 'みなとみらいの景色（展望足湯庭園）',
  description: '名物の展望足湯で贅沢にみなとみらいの景色を楽しめます。',
  image_filename: 'img/tenbouashiyu.jpg',
  category: 'saw'
)



GalleryItem.create!(
  name: 'カフェテリア',
  description: 'こちらはリニューアルオープンしました。ここではドリンクバーなど飲み放題！',
  image_filename: 'img/cafeteria.png',
  category: 'dining'
)

GalleryItem.create!(
  name: '憩い処',
  description: '24時間お好きな時間に利用可能な場所になっています。',
  image_filename: 'img/ikoidokoro.jpg',
  category: 'dining'
)

GalleryItem.create!(
  name: '万葉庵(半個室)',
  description: '料亭を思わせる空間で、みなとみらいの景色を見ながらお食事ができます。',
  image_filename: 'img/utatane.jpg',
  category: 'dining'
)



GalleryItem.create!(
  name: '万葉御膳',
  description: '「天ぷら」「そば」「すし」など、万葉倶楽部の定番メニューです。',
  image_filename: 'img/manyou_gozen.jpg',
  category: 'saw_food'
)

GalleryItem.create!(
  name: '親子丼',
  description: '新鮮な卵と国産の鶏肉のハーモニーをお楽しみください。',
  image_filename: 'img/manyou_donmono.jpg',
  category: 'saw_food'
)

GalleryItem.create!(
  name: 'チョコレートパフェ',
  description: 'チョコレートをふんだんに使用した、贅沢なパフェです。',
  image_filename: 'img/manyou_sweets.png',
  category: 'saw_food'
)



GalleryItem.create!(
  name: '展望足湯庭園',
  description: '外周約50メートル程の足湯庭園からは、みなとみらいの景観が一望できます。',
  image_filename: 'img/tenbouashiyu.jpg',
  category: 'saw_onsen'
)

GalleryItem.create!(
  name: '露天風呂',
  description: '本物の名湯を開放的な露天風呂で、味わえます。',
  image_filename: 'img/outdoor_bath.jpg',
  category: 'saw_onsen'
)

GalleryItem.create!(
  name: '寝湯',
  description: '全身脱力でき、リラクゼーションと血行促進に効果が高い入浴方法です。',
  image_filename: 'img/bed_bath.jpg',
  category: 'saw_onsen'
)


# watch.html.erb

GalleryItem.create!(
  name: '入り口（装飾品）',
  description: '満天の湯はお客様の第二の我が家としてくつろげる空間を心がけています。',
  image_filename: 'img/manten-yu2.jpg',
  category: 'watch'
)

GalleryItem.create!(
  name: '館内図',
  description: '飾らず、気取らず、ありのままの過ごし方で満天の湯を満喫してください。',
  image_filename: 'img/kannai-map.jpg',
  category: 'watch'
)

GalleryItem.create!(
  name: 'お食事処『山水草木』',
  description: '利用目的に合わせた豊富なメニューをご用意しております。',
  image_filename: 'img/manten_eat.jpg',
  category: 'watch'
)



GalleryItem.create!(
  name: '天丼',
  description: '数種類の揚げたて天ぷらを贅沢に丼物にしました。',
  image_filename: 'img/manten_food1.jpg',
  category: 'watch_food'
)

GalleryItem.create!(
  name: '山水草木名物 おばんざい御膳',
  description: 'おにぎりにおかずがたっぷりある満天の湯名物の逸品です。',
  image_filename: 'img/manten_food2.jpg',
  category: 'watch_food'
)

GalleryItem.create!(
  name: '手まりパフェ',
  description: '京都産の抹茶に白玉にあんこの入った贅沢な名物スイーツです。',
  image_filename: 'img/manten_food3.jpg',
  category: 'watch_food'
)



GalleryItem.create!(
  name: '天然温泉岩風呂',
  description: '当地より湧出している天然温泉が楽しめる、天然石の岩風呂です。',
  image_filename: 'img/manten_spa1.jpg',
  category: 'watch_onsen'
)

GalleryItem.create!(
  name: 'シルクの湯',
  description: 'やさしいミクロの泡と超音波で皮膚の奥まで浸透し血行を促進する温泉です。',
  image_filename: 'img/manten_spa2.jpg',
  category: 'watch_onsen'
)

GalleryItem.create!(
  name: '日替風呂',
  description: '四季折々に特徴のある入浴剤を使用し、香りでリラックス効果のある温泉です。',
  image_filename: 'img/manten_spa3.jpg',
  category: 'watch_onsen'
)


# seeing.html.erb

GalleryItem.create!(
  name: '外観',
  description: '「蔵」をイメージしたスタイリッシュで和モダンなデザインであなたをお出迎え',
  image_filename: 'img/oyugiwa_exterior.jpg',
  category: 'seeing'
)

GalleryItem.create!(
  name: 'テラス',
  description: '開放感あふれる中庭で、ほてった体をクールダウンできます。',
  image_filename: 'img/oyugiwa_terrace.jpg',
  category: 'seeing'
)

GalleryItem.create!(
  name: 'くつろぎスペース（ごろ寝穴）',
  description: 'シェルフやごろ寝穴にこもって漫画に読みふけったり寛いてください。',
  image_filename: 'img/oyugiwa_kutsurogi.jpg',
  category: 'seeing'
)



GalleryItem.create!(
  name: '十五穀米',
  description: '15種類の雑穀がブレンドされた、OYUGIWA特製十五穀米です。',
  image_filename: 'img/oyugiwa_food1.jpg',
  category: 'seeing_food'
)

GalleryItem.create!(
  name: 'おゆぎわ名物 スンドゥブ',
  description: '自家製ラー油に海鮮の風味を効かせた、OYUGIWA名物料理です。',
  image_filename: 'img/oyugiwa_food2.jpg',
  category: 'seeing_food'
)

GalleryItem.create!(
  name: '生姜焼き定食',
  description: 'にんにくと生姜をたっぷりと効かせた、スタミナ満点の逸品です。',
  image_filename: 'img/oyugiwa_food3.jpg',
  category: 'seeing_food'
)



GalleryItem.create!(
  name: '炭酸泉',
  description: '広々とした内湯に、じんわり体があたたまる大人気の炭酸泉になります。',
  image_filename: 'img/oyugiwa_onsen1.jpg',
  category: 'seeing_onsen'
)

GalleryItem.create!(
  name: '美泡壺湯',
  description: 'お湯が湧きだす壺湯に泡が肌の奥まで浸透し血行を促進する温泉です。',
  image_filename: 'img/oyugiwa_onsen2.jpg',
  category: 'seeing_onsen'
)

GalleryItem.create!(
  name: 'イベント湯',
  description: '露天でじっくりと温まり、様々なお湯が楽しめるイベント湯です。',
  image_filename: 'img/oyugiwa_onsen3.jpg',
  category: 'seeing_onsen'
)



# looking.html.erb

GalleryItem.create!(
  name: '入り口',
  description: '「今日は、ちょっと贅沢する」と思ったあなた、癒し満ゆく憩いのひと時をどうぞ。',
  image_filename: 'img/yukaraku_outside.jpeg',
  category: 'looking'
)

GalleryItem.create!(
  name: 'エントランス',
  description: 'あなたが日々の喧噪を忘れ、穏やかな時を悠然と心ゆくまで愉しめますように。',
  image_filename: 'img/yukaraku_kannai.jpg',
  category: 'looking'
)

GalleryItem.create!(
  name: 'お食事処「華」',
  description: '旅館で食べる食事のようなきめ細やかな極上の味をご堪能ください。',
  image_filename: 'img/yukaraku_eat.jpg',
  category: 'looking'
)



GalleryItem.create!(
  name: '生姜焼き定食',
  description: '清川恵水ポークというやわらかい肉質、甘みのある脂質の豚肉を贅沢に使用した逸品です',
  image_filename: 'img/yukaraku_food1.jpeg',
  category: 'looking_food'
)

GalleryItem.create!(
  name: 'カツ丼',
  description: 'こちらも厚切りした清川恵水ポークと寿雀卵というブランド卵を贅沢に使用した逸品です',
  image_filename: 'img/yukaraku_food2.jpg',
  category: 'looking_food'
)

GalleryItem.create!(
  name: 'お刺身５種盛り',
  description: '海老やマグロなどお刺身が贅沢に5種盛った贅沢な逸品です。',
  image_filename: 'img/yukaraku_food3.jpg',
  category: 'looking_food'
)



GalleryItem.create!(
  name: '源泉炭酸泉',
  description: 'お肌にやさしい美肌の湯と言われ、冷え性・貧血などに効果が期待できます。',
  image_filename: 'img/yukaraku_onsen1.jpg',
  category: 'looking_onsen'
)

GalleryItem.create!(
  name: '源泉露天風呂',
  description: '昼は青空、夜は濃紺の空と月を見上げながら入浴をお楽しみ頂けます。',
  image_filename: 'img/yukaraku_onsen2.jpg',
  category: 'looking_onsen'
)

GalleryItem.create!(
  name: '源泉檜風呂',
  description: '屋根付きの檜風呂で、檜の高級感あふれる香りとともにゆっくりと入浴できます。',
  image_filename: 'img/yukaraku_onsen3.jpg',
  category: 'looking_onsen'
)



# check.html.erb

GalleryItem.create!(
  name: 'お休み処',
  description: 'ゆっくりとおくつろぎいただける男女共用のお休み処になります。',
  image_filename: 'img/soukai_rest1.jpg',
  category: 'check'
)

GalleryItem.create!(
  name: '貸し部屋',
  description: '周りに気兼ねせず、のんびりおくつろぎいただける部屋です。温泉宿気分をお楽しみください。',
  image_filename: 'img/soukai_room1.jpg',
  category: 'check'
)

GalleryItem.create!(
  name: 'リラクゼーションルーム',
  description: '広々空間に一人一台テレビが付いた、自由にくつろげるリクライニングチェアを完備しています。',
  image_filename: 'img/soukai_relax1.jpg',
  category: 'check'
)




GalleryItem.create!(
  name: '十勝天せいろ蕎麦',
  description: '十勝産の蕎麦粉に天ぷらを添えた贅沢な逸品です。',
  image_filename: 'img/soukai_food1.jpg',
  category: 'check_food'
)

GalleryItem.create!(
  name: 'ロースかつ',
  description: '神奈川県産の上質なブランド豚である「相模豚」を厚切りに揚げた逸品です。',
  image_filename: 'img/soukai_food2.jpg',
  category: 'check_food'
)

GalleryItem.create!(
  name: 'クリームあんみつ',
  description: '白玉にあんこにソフトクリームなどをたっぷり入れた絶品スイーツです。',
  image_filename: 'img/soukai_food3.jpg',
  category: 'check_food'
)



GalleryItem.create!(
  name: '源泉の湯',
  description: 'とろりとした黒湯の源泉100%の加水なし天然温泉になります。別名「美肌の湯」言われています。',
  image_filename: 'img/soukai_onsen1.jpg',
  category: 'check_onsen'
)

GalleryItem.create!(
  name: '掛け流しの湯',
  description: '自慢の源泉を贅沢に掛け流し源泉です。露天ならではの移りゆく季節をお楽しみいただけます。',
  image_filename: 'img/soukai_onsen2.jpg',
  category: 'check_onsen'
)

GalleryItem.create!(
  name: '特別風呂',
  description: '特徴的な黒湯の天然温泉です。期間限定で、数種類の生薬を配合した特別薬湯をお楽しみいただけます。',
  image_filename: 'img/soukai_onsen3.jpg',
  category: 'check_onsen'
)



# try.html.erb

GalleryItem.create!(
  name: '館内',
  description: '日常を忘れさせる、高級感あふれる静寂のひとときをどうぞ。',
  image_filename: 'img/yukemuri_kannai.jpg',
  category: 'try'
)

GalleryItem.create!(
  name: 'お休み処',
  description: '日常を忘れる、大人の隠れ家としてお過ごしください。',
  image_filename: 'img/yukemuri_main1.jpg',
  category: 'try'
)

GalleryItem.create!(
  name: '前庭',
  description: '高級旅館のようなお庭であなたをお出迎えします。',
  image_filename: 'img/yukemuri_main2.jpg',
  category: 'try'
)




GalleryItem.create!(
  name: '作りたて手前仕込み豆冨',
  description: '豆乳・にがりを合わせ、お客様の目の前で仕上がるお豆冨は絶品です。',
  image_filename: 'img/yukemuri_food1.jpg',
  category: 'try_food'
)

GalleryItem.create!(
  name: '健康増進丼御膳',
  description: '納豆にオクラ、とろろなど体に良い食材を贅沢に丼物にしました。',
  image_filename: 'img/yukemuri_food2.jpg',
  category: 'try_food'
)

GalleryItem.create!(
  name: '国産牛肉と野菜のせいろ蒸し',
  description: '国産にこだわった牛肉に、国内産の野菜をふんだんに使用した逸品です。',
  image_filename: 'img/yukemuri_food3.jpg',
  category: 'try_food'
)



GalleryItem.create!(
  name: '炭酸琥珀湯',
  description: '湧き出た天然温泉に、医療分野でも活用されている「中空糸膜」を通して炭酸ガスを溶かしこんだものです。',
  image_filename: 'img/yukemuri_onsen1.jpg',
  category: 'try_onsen'
)

GalleryItem.create!(
  name: '源泉かけ流し風呂・岩風呂',
  description: '美肌の湯として有名なナトリウム炭酸水素塩温泉で、黒褐色のお湯が特徴です。',
  image_filename: 'img/yukemuri_onsen2.jpg',
  category: 'try_onsen'
)

GalleryItem.create!(
  name: '内風呂',
  description: '内風呂も源泉を使用しております。様々な特徴があるお風呂をお楽しみいただけます。',
  image_filename: 'img/yukemuri_onsen3.jpg',
  category: 'try_onsen'
)


# gaze.html.erb

GalleryItem.create!(
  name: '外観',
  description: '情緒あふれる和風づくりの隠れ家湯宿であなたをお出迎えします。',
  image_filename: 'img/serigaya.jpg',
  category: 'gaze'
)

GalleryItem.create!(
  name: '売店',
  description: '極楽湯にしかないオリジナルの商品もあるので、ぜひ立ち寄ってください。',
  image_filename: 'img/gokuraku_kannai.jpg',
  category: 'gaze'
)

GalleryItem.create!(
  name: 'お食事処',
  description: 'レトロ感ある広い大広間には、さまざまなお料理を満喫できます。',
  image_filename: 'img/gokuraku_dining1.jpg',
  category: 'gaze'
)



GalleryItem.create!(
  name: '肉厚熟成プレミアムかつ定食',
  description: '熟成豚を使用した、肉厚なカツは食べれば至福な気持ちになります。',
  image_filename: 'img/gokuraku_food1.jpg',
  category: 'gaze_food'
)

GalleryItem.create!(
  name: '四川麻婆豆腐定食',
  description: '四川風の本格的な辛さの麻婆豆腐で、箸が止まらない逸品です。',
  image_filename: 'img/gokuraku_food2.jpg',
  category: 'gaze_food'
)

GalleryItem.create!(
  name: 'パフェ',
  description: '4種類から選べる贅沢なスイーツです。ミニサイズもあるので安心です。',
  image_filename: 'img/gokuraku_food3.jpg',
  category: 'gaze_food'
)



GalleryItem.create!(
  name: '黒湯 天然温泉「自然の湯」',
  description: '温泉は『ナトリウム一化物・炭酸水素塩泉』で、別名「熱の湯」とも呼ばれ、湯冷めしにくいことが特徴です。',
  image_filename: 'img/gokuraku_onsen1.jpg',
  category: 'gaze_onsen'
)

GalleryItem.create!(
  name: '水素風呂',
  description: 'お湯にたっぷり含ませた水素は、酸化された細胞を還元し、老化抑制に良いといわれています。',
  image_filename: 'img/gokuraku_onsen2.jpg',
  category: 'gaze_onsen'
)

GalleryItem.create!(
  name: '黒湯 天然温泉「岩風呂」',
  description: '外気とふれあいながら温泉気分を存分に味わえます。解放感いっぱいで気分も理リラックスできます。',
  image_filename: 'img/gokuraku_onsen3.jpg',
  category: 'gaze_onsen'
)