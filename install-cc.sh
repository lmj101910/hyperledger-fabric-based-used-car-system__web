#!/bin/bash
set -ev

# install chaincode for channelsales1
docker exec cli1 peer chaincode install -n car-cc-ch1 -v 1.0.6 -p chaincode/go
sleep 1
# instantiate chaincode for channelsales1
docker exec cli1 peer chaincode instantiate -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -v 1.0.6 -c '{"Args":[""]}' -P "OR ('Sales1Org.member','CustomerOrg.member', 'Insurance1Org.member', 'Repair1.member')"
sleep 6
# invoke chaincode for channelsales1
#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"initWallet","Args":[""]}'
#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setWallet","Args":["Byun", "bkw1212", "200"]}'
#sleep 2
#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setWallet","Args":["Lee", "lmj1212", "400"]}'
#sleep 3

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["이명재", "lmj1212","12345678", "400", "0"]}' # 구매자
sleep 3

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["변교웅", "bkw1212","23456789", "200", "1"]}' # 수리기사
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["백근우", "bgw1212","34567890", "200", "0"]}' # 판매자 A
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["이성원", "jusk2","45678901", "200", "0"]}' # 판매자 B
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["이상현", "lsh1212","56789012", "200", "0"]}' # 판매자 C
sleep 2

docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"login","Args":["bkw1212","2345678"]}'
sleep 2


# Car base data
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21288072_26332051978708439.jpg", "한국GM 더 뉴 말리부 1.3 터보 프리미어", "국산", "중형차", "한국GM", "말리부", "더 뉴 말리부", "1.3 터보 프리미어", "2019", "18년10월(19년형)", "3686", "22500000", "개인", "파랑색", "가솔린", "CVT", "",  "X", "4", "서울", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar", "Args":["images/car/21804155_4460426425411305.jpg", "기아 더 K9 3.8 GDI 4WD 플래티넘Ⅱ", "국산", "대형차", "기아", "K9", "더 K9", "3.8 GDI 4WD 플래티넘Ⅱ", "2020", "20년04월(20년식)", "32679", "46500000", "개인", "검정색", "가솔린", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21793801_38077869703021098.jpeg", "현대 쏘나타 뉴 라이즈 2.0 스마트", "국산", "중형차", "현대", "쏘나타", "쏘나타 뉴 라이즈", "2.0 스마트", "2018", "17년05월(18년식)", "94770", "14200000", "개인", "회색", "가솔린", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21691708_2403875842403125.jpg", "제네시스 G90 3.8 GDi AWD 프레스티지", "국산", "대형차", "제네시스", "G90", "G90 3.8 GDi", "AWD 프레스티지", "2019", "18년11월(19년식)", "36500", "69900000", "개인", "엄버브라운", "가솔린", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21674127_35279499601809197.jpeg", "현대 쏘나타 뉴 라이즈 2.0 LPi 렌터카 스타일", "국산", "중형차", "현대", "쏘나타", "쏘나타 뉴 라이즈", "2.0 LPi 렌터카 스타일", "2018", "17년04월(18년형)", "116516", "10900000", "개인", "흰색", "LPG", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이상현"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21643508_34626559212839331.jpeg", "기아 더 K9 3.3 T-GDI 4WD 마스터즈Ⅱ", "국산", "대형차", "기아", "K9", "더 K9", "3.3 T-GDI 4WD 마스터즈Ⅱ", "2020", "19년04월(20년식)", "20537", "49000000", "개인", "검정색", "가솔린", "오토", "",  "X", "4", "서울", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21589923_1015963081720839.jpg", "현대 쏘나타 뉴 라이즈 2.0 LPi 렌터카 스타일", "국산", "중형차", "현대", "쏘나타", "쏘나타 뉴 라이즈", "2.0 LPi 렌터카 스타일", "2018", "17년04월(18년형)", "85792", "12300000", "개인", "회색", "가솔린", "오토", "",  "X", "4", "서울", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21601294_33684111142700130.jpg", "르노삼성 SM5 노바 LPLi 택시/렌터카 고급형", "국산", "중형차", "르노삼성", "SM5", "SM5 노바", "LPLi", "2021", "17년04월(17년식)", "118000", "7600000", "개인", "흰색", "LPG", "오토", "",  "X", "4", "대구", "new", "", "", "bkw1212", "이상현"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/22158556_4289908551527791.jpg", "기아 올 뉴 K7 2.4 GDI 노블레스", "국산", "준대형차", "기아", "K7", "올 뉴 K7", "2.4 GDI 노블레스", "2019", "19년06월(19년식)", "25255", "27100000", "개인", "검정색", "가솔린", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21577181_33446477886479853.jpg", "현대 쏘나타 뉴 라이즈 2.0 LPi 렌터카 모던", "국산", "중형차", "현대", "쏘나타", "쏘나타 뉴 라이즈", "2.0 LPi", "2018", "17년08월(18년식)", "108376", "11300000", "개인", "흰색", "LPG", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21386878_28675631371858690.jpeg", "기아 올 뉴 K7 3.0 LPI 렌터카 럭셔리", "국산", "준대형차", "기아", "K7", "올 뉴 K7", "3.0 LPI 렌터카 럭셔리", "2017", "17년05월(17년식)", "131576", "15500000", "개인", "흰색", "LPG", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이상현"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21262164_25732548402219611.jpg", "현대 그랜저IG 2.4 프리미엄 기본형", "국산", "준대형차", "현대", "그랜저", "그랜저 IG", "2.4 프리미엄", "2019", "18년10월(19년형)", "19307", "26000000", "개인", "갈색", "가솔린", "오토", "",  "X", "4", "대구", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21661422_34934635319913516.jpeg", "기아 올 뉴 K7 3.0 GDi 프레스티지", "국산", "준대형차", "기아", "K7", "올 뉴 K7", "3.0 GDi 프레스티지", "2018", "18년09월(18년식)", "86488", "17900000", "개인", "검정색", "가솔린", "오토", "",  "X", "4", "경기", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21796908_3817035435436436.jpeg", "현대 그랜저IG 2.4 프리미엄 기본형", "국산", "중형차", "현대", "그랜저", "그랜저IG", "2.4 프리미엄", "2019", "19년03월(19년식)", "25000", "29500000", "개인", "검정색", "가솔린", "오토", "", "X", "4", "울산", "new", "", "", "bkw1212", "이상현"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21796908_3817035435436436.jpeg", "현대 쏘나타 (DN8) 2.0 프리미엄", "국산", "중형차", "현대", "쏘나타", "쏘나타 (DN8)", "2.0 프리미엄", "2021", "21년03월(21년형)", "1718", "25700000", "개인", "회색", "가솔린", "오토", "", "X", "4", "경기", "new", "", "", "bkw1212", "벡근우"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21796908_3817035435436436.jpeg", "기아 올 뉴 K7 3.3 GDI 노블레스", "국산", "준대형차", "기아", "K7", "올 뉴 K7", "3.3 GDI 노블레스", "2017", "17년02월(17년식)", "51723", "18300000", "개인", "검정색", "가솔린", "오토", "", "X", "4", "경기", "new", "", "", "bkw1212", "이성원"]}'
sleep 3
docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setCar","Args":["images/car/21796908_38170248637671208.jpeg", "제네시스 G80(DH) 3.3 GHI AWD 프리미엄 럭셔리", "국산", "준대형차", "현대", "G80", "G80(DH)", "3.3 GDI AWD 프리미엄 럭셔리", "2018", "18년01월(18년식)", "37541", "38900000", "개인", "검정색", "가솔린", "오토", "", "X", "4", "경기", "new", "", "", "bkw1212", "이상현"]}'



sleep 3

# query chaincode for channelsales1
docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"getCar","Args":["CAR1"]}'
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"purchaseCar","Args":["lmj1212", "bkw1212", "CAR0"]}'
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setRepair","Args":["baek", "2021/06/14", "CAR1", "추돌사고 - 타이어 휠 교체 및 엔진 점검"]}'
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setRepair","Args":["baek", "2021/09/29", "CAR1", "추돌사고 - 차체수리 "]}'
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"getRepair","Args":["REPAIR0"]}'
sleep 2

docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"getAllRepair","Args":[""]}'
sleep 2

#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setInsurance","Args":["CAR1", "2021/06/14 ~ 2022/06/14"]}'
#sleep 2

#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setInsurance","Args":["CAR0", "2021/01/14 ~ 2022/01/14"]}'
#sleep 2

#docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"getInsurance","Args":["INSURANCE0"]}'
#sleep 3

#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setRenewal","Args":["INSURANCE0", "2022/06/14 ~ 2023/06/14"]}'
sleep 2

#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"setRenewal","Args":["INSURANCE1", "2022/06/14 ~ 2023/06/14"]}'
#sleep 2

#docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"getInsurance","Args":["INSURANCE0"]}'
#sleep 2

#docker exec cli1 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"createUser","Args":["bkw1212", "k970307r"]}'
#sleep 2

#docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"login","Args":["bkw1212", "k970307r"]}'
#sleep 2

#docker exec cli1 peer chaincode query -o orderer1.hub.com:7050 -C channelsales1 -n car-cc-ch1 -c '{"function":"exist","Args":["bkw1212"]}'
#sleep 2

# install chaincode for channelsales2
#docker exec cli2 peer chaincode install -n car-cc-ch2 -v 1.0.1 -p chaincode/go
#sleep 1
# install chaincode for channelsales2
#docker exec cli2 peer chaincode instantiate -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -v 1.0.1 -c '{"Args":[""]}' -P "OR ('Sales2Org.member','CustomerOrg.member', 'Insurance2Org.member', 'Repair2Org.member')"
#sleep 3
# invoke chaincode for channelsales2
#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n music-cc-ch2 -c '{"function":"initWallet","Args":[""]}'
#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"setWallet","Args":["Baek", "Baek1212", "300"]}'
#sleep 2
#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"setWallet","Args":["Han", "Han1212", "500"]}'
#sleep 3

#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"setCar","Args":["G70", "Genesis", "30", "Han1212"]}'
#sleep 2
#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"setCar","Args":["K7", "KIA", "20", "Baek1212"]}'
#sleep 2
#docker exec cli2 peer chaincode invoke -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"setCar","Args":["Sonata", "Hyundai", "20", "Baek1212"]}'

#sleep 3
# query chaincode for channelsales2
#docker exec cli2 peer chaincode query -o orderer1.hub.com:7050 -C channelsales2 -n car-cc-ch2 -c '{"function":"getCar","Args":["CAR0"]}'

