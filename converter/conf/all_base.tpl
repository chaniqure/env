{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enable: true
  ipv6: false
  listen: 0.0.0.0:1053
  # enhanced-mode: fake-ip
  # fake-ip-range: 198.18.0.1/16
  # prefer-h3: true
  use-hosts: true
  #default-nameserver:
  #  - 223.5.5.5
  #  - 223.6.6.6
  nameserver:
    - 223.5.5.5
    - 223.6.6.6
  # fake-ip-filter:
  #   - "*.lan"
  #   - localhost.ptlogin2.qq.com
  #   - dns.msftncsi.com
  #   - "*.srv.nintendo.net"
  #   - "*.stun.playstation.net"
  #   - xbox.*.microsoft.com
  #   - "*.xboxlive.com"
  fallback:
    - 1.1.1.1
    - 8.8.8.8
  fallback-filter:
    geoip: true
    geoip-code: CN
    ipcidr:
      - 240.0.0.0/4
# dns:
#   enable: true
#   listen: :1053
#dns:
#  enable: true
#  listen: :1053
#  default-nameserver:
#    - 223.5.5.5
#    - 223.6.6.6
#  nameserver:
#    - 223.5.5.5
#    - 223.6.6.6
#    - tls://dns.alidns.com
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
dns-server = 223.5.5.5,223.6.6.6
encrypted-dns-server = quic://223.5.5.5,quic://223.6.6.6
ipv6 = false
loglevel = notify
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
internet-test-url = http://www.aliyun.com
proxy-test-url = http://www.gstatic.com/generate_204
test-timeout = 4
exclude-simple-hostnames = true
read-etc-hosts = true
show-error-page-for-reject = true
disable-geoip-db-auto-update = true
http-api-web-dashboard = true
hijack-dns = *:53
http-listen = 0.0.0.0
socks5-listen = 0.0.0.0
allow-wifi-access = true
allow-hotspot-access = true
wifi-access-http-port = 6152
wifi-access-socks5-port = 6153
external-controller-access = 123456@127.0.0.1:6170

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js
# 京东签到
京东多合一签到 = type=cron,cronexp=0 1 */12 * * *,wake-system=1,timeout=600,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
# 京东游戏及其他
#京东价格提醒 = type=cron,cronexp=5 0 * * *,script-path=https://raw.githubusercontent.com/toulanboy/scripts/master/jd_price_detect/jd_price_detect.js,wake-system=true,timeout=600
京东抽奖机 = type=cron,cronexp=11 0 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/scripts/jd/jd_lotteryMachine.js
京东排行榜 = type=cron,cronexp=0 13 9 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/scripts/jd/jd_rankingList.js
京东白条 = type=cron,cronexp=0 9 * * *, wake-system=1,timeout=10,script-path=https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/scripts/jd/jd_baiTiao.js
京东特权值 = type=cron,cronexp=5 8 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/iisams/Scripts/master/liwo/jdtqz.js

# 其他签到
Bilibili签到 = type=cron,cronexp=10 0 0 * * *,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.js,script-update-interval=0
Bilibili银瓜子转硬币 = type=cron,cronexp=10 0 0 * * *,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.silver2coin.js,script-update-interval=0
网易云签到 = type=cron,cronexp=10 0 0 * * *,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasemusic/neteasemusic.js,script-update-interval=0
中国联通签到 = script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.js,type=cron,cronexp=10 0 0 * * *
爱奇艺签到 = type=cron,cronexp=11 0 * * *,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js
快手极速版签到 = type=cron,cronexp=35 5 0 * * *,script-path=https://raw.githubusercontent.com/Sunert/Scripts/master/Task/kuaishou.js,script-update-interval=0
机场签到 = type=cron,cronexp=5 0 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/evilbutcher/Quantumult_X/master/check_in/glados/checkin_env.js
机场签到Cookie版 = type=cron,cronexp=5 0 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/evilbutcher/Quantumult_X/master/check_in/glados/checkincookie_env.js
吾爱破解 = type=cron,cronexp=5 0 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/52pojie-DailyBonus/52pojie.js
美团 = type=cron,cronexp=3 0 * * *,wake-system=1,timeout=20,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/meituan/meituan.js
切换会话 = type=cron,cronexp=11 0 * * *,wake-system=1,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/box/switcher/box.switcher.js

[URL Rewrite]
# AbeamTV Unlock
^https?:\/\/api\.abema\.io\/v\d\/ip\/check - reject

# Redirect Google Service
^https?:\/\/(www.)?g\.cn https://www.google.com 302
^https?:\/\/(www.)?google\.cn https://www.google.com 302

# Redirect HTTP to HTTPS
^https?:\/\/(www.)?taobao\.com\/ https://www.taobao.com/ 302
^https?:\/\/(www.)?jd\.com\/ https://www.jd.com/ 302
^https?:\/\/(www.)?mi\.com\/ https://www.mi.com/ 302
^https?:\/\/you\.163\.com\/ https://you.163.com/ 302
^https?:\/\/(www.)?suning\.com/ https://suning.com/ 302
^https?:\/\/(www.)?yhd\.com https://yhd.com/ 302

# Redirect False to True
# >> IGN China to IGN Global
^https?:\/\/(www.)?ign\.xn--fiqs8s\/ http://cn.ign.com/ccpref/us 302
# >> Fake Website Made By Makeding
^https?:\/\/(www.)?abbyychina\.com\/ http://www.abbyy.cn/ 302
^https?:\/\/(www.)?bartender\.cc\/ https://cn.seagullscientific.com 302
^https?:\/\/(www.)?betterzip\.net\/ https://macitbetter.com/ 302
^https?:\/\/(www.)?beyondcompare\.cc\/ https://www.scootersoftware.com/ 302
^https?:\/\/(www.)?bingdianhuanyuan\.cn\/ http://www.faronics.com/zh-hans/ 302
^https?:\/\/(www.)?chemdraw\.com\.cn\/ http://www.cambridgesoft.com/ 302
^https?:\/\/(www.)?codesoftchina\.com\/ https://www.teklynx.com/ 302
^https?:\/\/(www.)?coreldrawchina\.com\/ https://www.coreldraw.com/cn/ 302
^https?:\/\/(www.)?crossoverchina\.com\/ https://www.codeweavers.com/ 302
^https?:\/\/(www.)?easyrecoverychina\.com\/ https://www.ontrack.com/ 302
^https?:\/\/(www.)?ediuschina\.com\/ https://www.grassvalley.com/ 302
^https?:\/\/(www.)?flstudiochina\.com\/ https://www.image-line.com/flstudio/ 302
^https?:\/\/(www.)?formysql\.com\/ https://www.navicat.com.cn 302
^https?:\/\/(www.)?guitarpro\.cc\/ https://www.guitar-pro.com/ 302
^https?:\/\/(www.)?huishenghuiying\.com\.cn\/ https://www.corel.com/cn/ 302
^https?:\/\/(www.)?iconworkshop\.cn\/ https://www.axialis.com/iconworkshop/ 302
^https?:\/\/(www.)?imindmap\.cc\/ https://imindmap.com/zh-cn/ 302
^https?:\/\/(www.)?jihehuaban\.com\.cn\/ https://sketch.io/ 302
^https?:\/\/(www.)?keyshot\.cc\/ https://www.keyshot.com/ 302
^https?:\/\/(www.)?mathtype\.cn\/ http://www.dessci.com/en/products/mathtype/ 302
^https?:\/\/(www.)?mindmanager\.cc\/ https://www.mindjet.com/ 302
^https?:\/\/(www.)?mindmapper\.cc\/ https://mindmapper.com 302
^https?:\/\/(www.)?mycleanmymac\.com\/ https://macpaw.com/cleanmymac 302
^https?:\/\/(www.)?nicelabel\.cc\/ https://www.nicelabel.com/ 302
^https?:\/\/(www.)?ntfsformac\.cc\/ https://www.tuxera.com/products/tuxera-ntfs-for-mac-cn/ 302
^https?:\/\/(www.)?ntfsformac\.cn\/ https://www.paragon-software.com/ufsdhome/zh/ntfs-mac/ 302
^https?:\/\/(www.)?overturechina\.com\/ https://sonicscores.com/overture/ 302
^https?:\/\/(www.)?passwordrecovery\.cn\/ https://cn.elcomsoft.com/aopr.html 302
^https?:\/\/(www.)?pdfexpert\.cc\/ https://pdfexpert.com/zh 302
^https?:\/\/(www.)?ultraiso\.net\/ https://cn.ezbsystems.com/ultraiso/ 302
^https?:\/\/(www.)?vegaschina\.cn\/ https://www.vegas.com/ 302
^https?:\/\/(www.)?xmindchina\.net\/ https://www.xmind.cn/ 302
^https?:\/\/(www.)?xshellcn\.com\/ https://www.netsarang.com/products/xsh_overview.html 302
^https?:\/\/(www.)?yuanchengxiezuo\.com\/ https://www.teamviewer.com/zhcn/ 302
^https?:\/\/(www.)?zbrushcn\.com\/ http://pixologic.com/ 302
^https://aweme-eagle(.*)\.snssdk\.com/aweme/v2/ https://aweme-eagle$1.snssdk.com/aweme/v1/ 302

# JD Protection
^https?:\/\/coupon\.m\.jd\.com\/ https://coupon.m.jd.com/ 302
^https?:\/\/h5\.m\.jd\.com\/ https://h5.m.jd.com/ 302
^https?:\/\/item\.m\.jd\.com\/ https://item.m.jd.com/ 302
^https?:\/\/m\.jd\.com\/ https://m.jd.com/ 302
^https?:\/\/newcz\.m\.jd\.com\/ https://newcz.m.jd.com/ 302
^https?:\/\/p\.m\.jd\.com\/ https://p.m.jd.com/ 302
^https?:\/\/so\.m\.jd\.com\/ https://so.m.jd.com/ 302
^https?:\/\/union\.click\.jd\.com\/jda? http://union.click.jd.com/jda?adblock= header
^https?:\/\/union\.click\.jd\.com\/sem.php? http://union.click.jd.com/sem.php?adblock= header
^https?:\/\/www.jd.com\/ https://www.jd.com/ 302

# Wiki
# ^https://zh.(m.)?wikipedia.org/zh(-\w*)?(?=/) https://www.wikiwand.com/zh$2 302
# ^https://(\w*).(m.)?wikipedia.org/wiki https://www.wikiwand.com/$1 302

# Resso

(?<=(carrier|account|sys|sim)_region=)cn in 307

# Advertising Block

# >> 2048Puzzle
^https?:\/\/a\.applovin\.com\/3\.0\/ad - reject

# >> 4gTV
^https?:\/\/service\.4gtv\.tv\/4gtv\/Data\/GetAD - reject
^https?:\/\/service\.4gtv\.tv\/4gtv\/Data\/ADLog - reject

# >> 58
^https?:\/\/.+\.58cdn\.com\.cn\/brandads\/ - reject
^https?:\/\/app\.58\.com\/api\/home\/advertising\/ - reject
^https?:\/\/app\.58\.com\/api\/home\/appadv\/ - reject
^https?:\/\/app\.58\.com\/api\/home\/invite\/popupAdv - reject
^https?:\/\/app\.58\.com\/api\/log\/ - reject

# >> AcFun
^https?:\/\/aes\.acfun\.cn\/s\?adzones - reject

# >> Ai NanNing
^https?:\/\/nnapp\.cloudbae\.cn\/mc\/api\/advert/ - reject

# >> Aihuishou
^https?:\/\/gw\.aihuishou\.com\/app-portal\/home\/getadvertisement - reject

# >> AMap
^https?:\/\/m\d{1}\.amap\.com\/ws\/valueadded\/alimama\/splash_screen\/ - reject

# >> Baicizhan
^https?:\/\/7n\.bczcdn\.com\/launchad\/ - reject

# >> Baidu
^https?:\/\/.+\/client\/phpui2\/ - reject
^https?:\/\/cover.baidu.com\/cover\/page\/dspSwitchAds\/ - reject
^https?:\/\/c\.tieba\.baidu\.com\/c\/s\/splashSchedule - reject
^https?:\/\/issuecdn\.baidupcs\.com\/issue\/netdisk\/guanggao\/ - reject
^https?:\/\/update\.pan\.baidu\.com\/statistics - reject

# >> Baobao
^https?:\/\/www\.myhug\.cn\/ad\/ - reject

# >> Beike Zhaofang
^https?:\/\/app\.api\.ke\.com\/config\/config\/bootpage - reject

# >> Beitaicuhfang
^https?:\/\/channel\.beitaichufang\.com\/channel\/api\/v\d\/promote\/ios\/start\/page - reject

# >> Bi ShiJie
^https?:\/\/iapi\.bishijie\.com\/actopen\/advertising\/ - reject

# >> Bilibili
^https?:\/\/app\.bilibili\.com\/x\/v\d\/splash\/ - reject

# >> ByteDance
^https?:\/\/.+\.(musical|snssdk)\.(com|ly)\/(api|motor)\/ad\/ - reject
^https?:\/\/.+\.pstatp\.com\/img\/ad - reject
^https?:\/\/.+\.snssdk\.com\/motor\/operation\/activity\/display\/config\/v\d\/ - reject
^https?:\/\/dsp\.toutiao\.com\/api\/xunfei\/ads\/ - reject

# >> CamScanner
^https?:\/\/api\.intsig\.net\/user\/cs\/operating\/app\/get_startpic\/ - reject

# >> Caocao Chuxin
^https?:\/\/cap\.caocaokeji\.cn\/advert-bss\/ - reject

# >> Chelaile
^https?:\/\/(api|atrace)\.chelaile\.net\.cn\/adpub\/ - reject
^https?:\/\/api\.chelaile\.net\.cn\/goocity\/advert\/ - reject
^https?:\/\/atrace\.chelaile\.net\.cn\/exhibit\?&adv_image - reject
^https?:\/\/pic1\.chelaile\.net\.cn\/adv\/ - reject

# >> ChinaMobile
^https?:\/\/app\.10086\.cn\/biz-orange\/DN\/(findSale|homeSale)\/getsaleAdver - reject

# >> ChinaUnicom
^https?:\/\/m\.client\.10010\.com\/mobileService\/customer\/accountListData\.htm - reject
^https?:\/\/m\.client\.10010\.com\/uniAdmsInterface\/(getWelcomeAd|getHomePageAd) - reject

# >> CNTV
^https?:\/\/asp\.cntv\.myalicdn\.com\/.+\?maxbr=850 - reject
^https?:\/\/cntv\.hls\.cdn\.myqcloud\.com\/.+\?maxbr=850 - reject
^https?:\/\/v\.cctv\.com\/.+850 - reject
^https?:\/\/www\.cntv\.cn\/nettv\/adp\/ - reject

# >> DanDan Zan
^https?:\/\/www\.dandanzan\.com\/res\/gdsefse\.js - reject

# >> DangDang
^https?:\/\/mapi\.dangdang\.com\/index\.php\?action=init - reject

# >> DayDayCook
^https?:\/\/api\.daydaycook\.com\.cn\/daydaycook\/server\/ad\/ - reject
^https?:\/\/cms\.daydaycook\.com\.cn\/api\/cms\/advertisement\/ - reject

# >> eLong
^https?:\/\/mobile-api2011\.elong\.com\/(adgateway|adv)\/ - reject
^https?:\/\/(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})(\.(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})){3}\/(adgateway|adv)\/ - reject

# >> Facebook
^https?:\/\/www\.facebook\.com\/.+video_click_to_advertiser_site - reject

# >> Fliggy
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.trip\.activity\.querytmsresources\/ - reject

# >> Flyer Tea
^https?:\/\/www\.flyertea\.com\/source\/plugin\/mobile\/mobile\.php\?module=advis - reject

# >> Foodie
^https?:\/\/foodie-api\.yiruikecorp\.com\/v\d\/(banner|notice)\/overview - reject

# >> FOTOABLE
^https?:\/\/cdn\.api\.fotoable\.com\/Advertise\/ - reject

# >> Gofun
^https?:\/\/gateway\.shouqiev\.com\/fsda\/app\/bootImage\.json - reject

# >> Google
^https?:\/\/.+\.youtube\.com\/api\/stats\/.+adformat - reject
^https?:\/\/.+\.youtube\.com\/api\/stats\/ads - reject
^https?:\/\/.+\.youtube\.com\/get_midroll - reject
^https?:\/\/.+\.youtube\.com\/get_midroll_ - reject
^https?:\/\/.+\.youtube\.com\/pagead\/ - reject
^https?:\/\/.+\.youtube\.com\/ptracking - reject
^https?:\/\/.+\.youtube\.com\/ptracking\? - reject
^https?:\/\/pagead2.googlesyndication.com\/pagead\/js\/? - reject
^https?:\/\/pagead2.googlesyndication.com\/pagead\/js\/? - reject
^https?:\/\/premiumyva\.appspot\.com\/vmclickstoadvertisersite - reject
^https?:\/\/www.google-analytics.com\/analytics.js - reject
^https?:\/\/www.google-analytics.com\/analytics.js - reject
^https?:\/\/youtubei\.googleapis\.com/.+ad_break - reject
^https?:\/\/youtubei\.googleapis\.com\/youtubei\/.+ad_ - reject
^https?:\/\/youtubei\.googleapis\.com\/youtubei\/.+log_ - reject

# >> Hangzhou Bus
^https?:\/\/m\.ibuscloud.com\/v\d\/app\/getStartPage - reject

# >> Hangzhou Citizen Card
^https?:\/\/smkmp\.96225.com\/smkcenter\/ad/ - reject

# >> Hupu
^https?:\/\/games\.mobileapi\.hupu\.com\/.+\/(interfaceAdMonitor|interfaceAd)\/ - reject
^https?:\/\/games\.mobileapi\.hupu\.com\/.+\/status\/init - reject

# >> IdleFish
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.taobao\.idle\.home\.welcome\/ - reject

# >> iFlytek
^https?:\/\/imeclient\.openspeech\.cn\/adservice\/ - reject

# >> iQiyi
^https?:\/\/act\.vip\.iqiyi\.com\/interact\/api\/show.do - reject
^https?:\/\/act\.vip\.iqiyi\.com\/interact\/api\/v\d\/show - reject
^https?:\/\/iface\.iqiyi\.com\/api\/getNewAdInfo - reject
^https?:\/\/t7z\.cupid\.iqiyi\.com\/mixer\? - reject

# >> JD
^https?:\/\/(bdsp-x|dsp-x)\.jd\.com\/adx\/ - reject
^https?:\/\/api\.m\.jd.com\/client\.action\?functionId=start - reject
^https?:\/\/ms\.jr\.jd\.com\/gw\/generic\/base\/na\/m\/adInfo - reject

# >> Jiemian
^https?:\/\/img\.jiemian\.com\/ads\/ - reject

# >> JXEDT
^https?:\/\/api\.jxedt\.com\/ad\/ - reject
^https?:\/\/richmanapi\.jxedt\.com\/api\/ad\/ - reject

# >> Keep
^https?:\/\/static1\.keepcdn\.com\/.+\d{3}x\d{4} - reject
^https?:\/\/api\.gotokeep\.com\/ads\/ - reject

# >> KFC
^https?:\/\/res\.kfc\.com\.cn\/advertisement\/ - reject

# >> Kingsoft
^https?:/\/\counter\.ksosoft.com\/ad\.php - reject
^https?:\/\/.+\.kingsoft-office-service\.com\/ad - reject
^https?:\/\/counter\.ksosoft\.com\/ad\.php - reject
^https?:\/\/dict-mobile\.iciba\.com\/interface\/index\.php\?.+(c=ad|collectFeedsAdShowCount|KSFeedsAdCardViewController) - reject
^https?:\/\/ios\.wps\.cn\/ad-statistics-service - reject
^https?:\/\/mobile-pic\.cache\.iciba\.com\/feeds_ad\/ - reject
^https?:\/\/service\.iciba\.com\/popo\/open\/screens\/v\d\?adjson - reject

# >> KouBei
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.o2o\.ad\.gateway\.get\/ - reject
^https?:\/\/render\.alipay\.com\/p\/s\/h5data\/prod\/spring-festival-2019-h5data\/popup-h5data\.json - reject

# >> Kuaikan Comic
^https?:\/\/api\.kkmh\.com\/.+(ad|advertisement)\/ - reject

# >> Kuwo
^https?:\/\/(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})(\.(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})){3}\/EcomResourceServer/AdPlayPage/adinfo - reject
^https?:\/\/(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})(\.(2(5[0-5]{1}|[0-4]\d{1})|[0-1]?\d{1,2})){3}\/MobileAdServer\/ - reject

# >> Le
^https?:\/\/.+\/letv-gug\/ - reject

# >> Luckin Coffee
^https?:\/\/.+\/resource\/m\/promo\/adsense - reject
^https?:\/\/.+\/resource\/m\/sys\/app\/adpos - reject

# >> MaFengWo
^https?:\/\/mapi\.mafengwo\.cn\/ad\/ - reject
^https?:\/\/mapi\.mafengwo\.cn\/travelguide\/ad\/ - reject

# >> Mahua Video
^https?:\/\/.+\/api\/app\/member\/ver2\/user\/login\/ - reject


# >> Maiduidui
^https?:\/\/mob\.mddcloud\.com\.cn\/api\/(ad|advert)\/ - reject

# >> Manhuaren
^https?:\/\/mangaapi\.manhuaren\.com\/v\d\/public\/getStartPageAds - reject


# >> Meituan
^https?:\/\/img\.meituan\.net\/midas\/ - reject
^https?:\/\/p([0-9])\.meituan\.net\/(mmc|wmbanner)\/ - reject
^https?:\/\/p\d{1}\.meituan\.net\/(adunion|display|linglong|mmc|wmbanner)\/ - reject
^https?:\/\/s3plus\.meituan\.net\/.+\/linglong\/ - reject

# >> Meiweibuyongdeng
^https?:\/\/capi.mwee.cn/app-api/V12/app/getstartad - reject

# >> MI
^https?:\/\/api\.m\.mi\.com\/v\d\/app\/start - reject
^https?:\/\/api\.jr\.mi\.com\/v\d\/adv\/ - reject
^https?:\/\/api\.jr\.mi\.com\/jr\/api\/playScreen - reject

# >> MI Fit
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/homepage_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sleep_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_summary_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_training_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/step_detail_ad\? - reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/training_video_ad\? - reject

# >> Miaopai
^https?:\/\/b-api\.ins\.miaopai\.com\/1\/ad/ - reject

# >> MIgu
^https?:\/\/.+\/v\d\/iflyad\/ - reject
^https?:\/\/.+\/cdn-adn\/ - reject
^https?:\/\/ggic\.cmvideo\.cn\/ad\/ - reject
^https?:\/\/ggic2\.cmvideo\.cn\/ad\/ - reject
^https?:\/\/.+/img\/ad\.union\.api\/ - reject

# >> MixC
^https?:\/\/app\.mixcapp\.com\/mixc\/api\/v\d\/ad - reject

# >> MogoRenter
^https?:\/\/api\.mgzf\.com\/renter-operation\/home\/startHomePage - reject

# >> MojiWeather
^https?:\/\/cdn\.moji\.com\/(adoss|adlink)\/ - reject

# >> Myhug
^https?:\/\/www\.myhug\.cn\/ad\/ - reject

# >> NationalGeographic
^https?:\/\/dili\.bdatu\.com\/jiekou\/ad\/ - reject

# >> NationalGeographicChina
^https?:\/\/wap\.ngchina\.cn\/news\/adverts\/ - reject

# >> NetEase
^https?:\/\/.+\/eapi\/(ad|log)\/ - reject
^https?:\/\/client\.mail\.163\.com\/apptrack\/confinfo\/searchMultiAds - reject
^https?:\/\/c\.m\.163\.com\/nc\/gl\/ - reject
^https?:\/\/dsp-impr2\.youdao\.com\/adload.s\? - reject
^https?:\/\/oimage([a-z])([0-9])\.ydstatic\.com\/.+adpublish - reject
^https?:\/\/sp\.kaola\.com\/api\/openad - reject
^https?:\/\/support\.you\.163\.com\/xhr\/boot\/getBootMedia\.json - reject

# >> ofo
^https?:\/\/supportda\.ofo\.com\/adaction\? - reject
^https?:\/\/ma\.ofo\.com\/ads\/ - reject
^https?:\/\/activity2\.api\.ofo\.com\/ofo\/Api\/v\d\/ads - reject
^https?:\/\/ma\.ofo\.com\/adImage\/ - reject

# >> PConline
^https?:\/\/agent-count\.pconline\.com\.cn\/counter\/adAnalyse\/ - reject
^https?:\/\/mrobot\.pcauto\.com\.cn\/v\d\/ad2p - reject
^https?:\/\/mrobot\.pcauto\.com\.cn\/xsp\/s\/auto\/info\/preload\.xsp - reject
^https?:\/\/mrobot\.pconline\.com\.cn\/s\/onlineinfo\/ad\/ - reject
^https?:\/\/mrobot\.pconline\.com\.cn\/v\d\/ad2p - reject

# >> PeanutWiFiMpass
^https?:\/\/cmsapi\.wifi8\.com\/v\d{1}\/(emptyAd|adNew)\/ - reject

# >> Qdaily
^https?:\/\/app3\.qdaily\.com\/app3\/boot_advertisements\.json - reject
^https?:\/\/notch\.qdaily\.com\/api\/v\d\/boot_ad - reject

# >> Qiongou
^https?:\/\/media\.qyer\.com\/ad\/ - reject
^https?:\/\/open\.qyer.com\/qyer\/config\/get - reject
^https?:\/\/open\.qyer\.com\/qyer\/startpage\/ - reject

# >> Qiuduoduo
^https?:\/\/api\.qiuduoduo\.cn\/guideimage - reject

# >> Renren Video
^https?:\/\/api\.rr\.tv\/ad\/ - reject
^https?:\/\/api\.videozhishi\.com\/api\/getAdvertising - reject
^https?:\/\/msspjh\.emarbox\.com\/getAdConfig - reject

# >> ShiHuo
^https?:\/\/www\.shihuo\.cn\/app3\/saveAppInfo - reject

# >> 首汽约车
^https?:\/\/gw-passenger\.01zhuanche\.com\/gw-passenger\/car-rest\/webservice\/passenger\/recommendADs - reject
^https?:\/\/gw-passenger\.01zhuanche\.com\/gw-passenger\/zhuanche-passenger-token\/leachtoken\/webservice\/homepage\/queryADs - reject

# >> Sina
^https?:\/\/edit\.sinaapp\.com\/ua\?t=adv - reject

# >> Sina Weather
^https?:\/\/tqt\.weibo\.cn\/.+advert\.index - reject
^https?:\/\/tqt\.weibo\.cn\/api\/advert\/ - reject
^https?:\/\/tqt\.weibo\.cn\/overall\/redirect\.php\?r=tqtad - reject
^https?:\/\/tqt\.weibo\.cn\/overall\/redirect\.php\?r=tqt_sdkad - reject

# >> Sina Weibo
^https?:\/\/sdkapp\.uve\.weibo\.com\/interface\/sdk\/sdkad\.php - reject
^https?:\/\/wbapp\.uve\.weibo\.com\/wbapplua\/wbpullad\.lua - reject
^https?:\/\/sdkapp\.uve\.weibo\.com/\interface\/sdk\/actionad\.php - reject

# >> SMZDM
^https?:\/\/api\.smzdm\.com\/v\d\/util\/loading - reject

# >> Snail Sleep
^https?:\/\/snailsleep\.net\/snail\/v\d\/adTask\/ - reject
^https?:\/\/snailsleep\.net\/snail\/v\d\/screen\/qn\/get\? - reject

# >> Sohu
^https?:\/\/api\.k\.sohu\.com\/api\/news\/adsense - reject
^https?:\/\/api\.tv\.sohu\.com\/agg\/api\/app\/config\/bootstrap - reject
^https?:\/\/hui\.sohu\.com\/predownload2/\? - reject
^https?:\/\/pic\.k\.sohu\.com\/img8\/wb\/tj\/ - reject
^https?:\/\/s1\.api\.tv\.itc\.cn\/v\d\/mobile\/control\/switch\.json - reject

# >> StarFans
^https?:\/\/a\.sfansclub\.com\/business\/t\/ad\/ - reject
^https?:\/\/a\.sfansclub\.com\/business\/t\/boot\/screen\/index - reject

# >> TaPiaoPiao
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.film\.mtopadvertiseapi\.queryadvertise\/ - reject

# >> Tencent Futu Securities
^https?:\/\/api5\.futunn\.com\/ad\/ - reject

# >> Tencent Game
^https?:\/\/qt\.qq\.com\/lua\/mengyou\/get_splash_screen_info - reject
^https?:\/\/ssl\.kohsocialapp\.qq\.com:10001\/game\/buttons - reject

# >> Tencent Maps
^https?:\/\/3gimg\.qq\.com\/tencentMapTouch\/app\/activity\/ - reject
^https?:\/\/newsso\.map\.qq\.com\/\?&attime= - reject

# >> Tencent News
^https?:\/\/r\.inews\.qq\.com\/adsBlacklist - reject
^https?:\/\/r\.inews\.qq\.com\/getFullScreenPic - reject
^https?:\/\/r\.inews\.qq\.com\/getQQNewsRemoteConfig - reject

# >> Tencent QQLive
^https?:\/\/.+\.mp4\?cdncode=.+&guid= - reject
^https?:\/\/.+\.mp4\?cdncode=.+&sdtfrom=v3004 - reject
^https?:\/\/btrace.qq.com - reject
^https?:\/\/vv\.video\.qq\.com\/getvmind\? - reject

# >> Tencent WeChat
^https?:\/\/mp\.weixin\.qq.com\/mp\/advertisement_report - reject
^https?:\/\/mp\.weixin\.qq.com\/mp\/ad_complaint - reject
^https?:\/\/mp\.weixin\.qq.com\/mp\/ad_video - reject

# >> The Paper
^https?:\/\/adpai\.thepaper\.cn\/.+&ad= - reject

# >> Thunder
^https?:\/\/images\.client\.vip\.xunlei\.com\/.+\/advert\/ - reject

# >> tskscn
^https?:\/\/47\.97\.20\.12\/ad\/ - reject

# >> TV_Home
^https?:\/\/api\.gaoqingdianshi\.com\/api\/v\d\/ad\/ - reject

# >> txffp
^https?:\/\/pss\.txffp\.com\/piaogen\/images\/launchScreen/ - reject

# >> UC
^https?:\/\/huichuan\.sm\.cn\/jsad - reject
^https?:\/\/iflow\.uczzd\.cn\/log\/ - reject

# >> Variflight
^https:\/\/app\.variflight\.com\/v4\/advert\/ - reject

# >> VUE
^https?:\/\/static\.vuevideo\.net\/styleAssets\/.+\/splash_ad - reject
^https?:\/\/static\.vuevideo\.net\/styleAssets\/advertisement\/ - reject

# >> WallStreetCN
^https?:\/\/api\.wallstreetcn\.com\/apiv\d\/advertising\/ - reject

# >> WeDoctor
^https?:\/\/app\.wy\.guahao\.com\/json\/white\/dayquestion\/getpopad - reject

# >> Weico
^https?:\/\/overseas\.weico\.cc/portal\.php\?a=get_coopen_ads - reject

# >> WeiDian
^https?:\/\/thor\.weidian\.com\/ares\/home\.splash\/ - reject

# >> WiFi Share Master
^https?:\/\/nochange\.ggsafe\.com\/ad\/ - reject

# >> WIFI8
^https?:\/\/cmsapi\.wifi8\.com\/v\d\/emptyAd\/info - reject
^https?:\/\/cmsapi\.wifi8\.com\/v\d\/adNew\/config - reject

# >> Wuta Cam
^https?:\/\/api-release\.wuta-cam\.com\/ad_tree - reject
^https?:\/\/res-release\.wuta-cam\.com\/json\/ads_component_cache\.json - reject

# >> Xiachufang
^https?:\/\/api\.xiachufang\.com\/v\d\/ad/ - reject

# >> Xiami music
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.alimusic\.common\.mobileservice\.startinit\/ - reject

# >> Xianyu
^https?:\/\/gw\.alicdn\.com\/mt\/ - reject
^https?:\/\/gw\.alicdn\.com\/tfs\/.+\d{3,4}-\d{4} - reject
^https?:\/\/gw\.alicdn\.com\/tps\/.+\d{3,4}-\d{4} - reject

# >> Xiao Shuimian
^https?:\/\/api\.psy-1\.com\/cosleep\/startup - reject

# >> Ximalaya
^https?:\/\/adse.+\.com\/[a-z]{4}\/loading\?appid= - reject
^https?:\/\/adse\.ximalaya\.com\/ting\/feed\?appid= - reject
^https?:\/\/adse\.ximalaya\.com\/ting\/loading\?appid= - reject
^https?:\/\/adse\.ximalaya\.com\/ting\?appid= - reject
^https?:\/\/fdfs\.xmcdn\.com\/group21\/M03\/E7\/3F\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group21\/M0A\/95\/3B\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group22\/M00\/92\/FF\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group22\/M05\/66\/67\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group22\/M07\/76\/54\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group23\/M01\/63\/F1\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group23\/M04\/E5\/F6\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group23\/M07\/81\/F6\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group23\/M0A\/75\/AA\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group24\/M03\/E6\/09\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group24\/M07\/C4\/3D\/ - reject
^https?:\/\/fdfs\.xmcdn\.com\/group25\/M05\/92\/D1\/ - reject

# >> Xunyou Booster
^https?:\/\/portal-xunyou\.qingcdn\.com\/api\/v\d\/ios\/configs\/(splash_ad|ad_urls) - reject
^https?:\/\/portal-xunyou\.qingcdn\.com\/api\/v\d{1}\/ios\/ads\/ - reject

# >> Yahoo!
^https?:\/\/m\.yap\.yahoo\.com\/v18\/getAds\.do - reject

# >> Yingshi Cloud Video
^https?:\/\/i\.ys7\.com\/api\/ads - reject

# >> YOUKU
^https?:\/\/.+\.mp4\?ccode=0902 - reject
^https?:\/\/.+\.mp4\?sid= - reject

# >> Youtube++
^https?:\/\/api\.catch\.gift\/api\/v\d\/pagead\/ - reject

# >> Yundongshijie
^https?:\/\/.+\.iydsj\.com\/api\/.+\/ad - reject

# >> YYeTs
^https?:\/\/ctrl\.(playcvn|zmzapi)\.(com|net)\/app\/(ads|init) - reject

# >> Zhiboba
^https?:\/\/a\.qiumibao\.com\/activities\/config\.php - reject
^https?:\/\/.+\/allOne\.php\?ad_name - reject

# >> Zhihu
^https?:\/\/www\.zhihu\.com\/terms\/privacy\/confirm - reject
^https?:\/\/api\.zhihu\.com\/market\/popover - reject
^https?:\/\/api\.zhihu\.com\/search\/(top|tab|preset) - reject
^https?:\/\/api\.zhihu\.com\/(launch|ad-style-service|app_config|real_time|ab\/api) - reject
^https?:\/\/api\.zhihu\.com\/commercial_api\/(launch|real_time) - reject
^https?:\/\/(api|www)\.zhihu\.com\/.*(featured-comment-ad|recommendations|community-ad) - reject
^https?:\/\/(api|www)\.zhihu\.com\/(fringe|adx|commercial|ad-style-service|banners|mqtt) - reject

# >> Zhuishushenqi
^https?:\/\/(api|b)\.zhuishushenqi\.com\/advert - reject
^https?:\/\/api01pbmp\.zhuishushenqi\.com\/gameAdvert - reject
^https?:\/\/api\.zhuishushenqi\.com\/notification\/shelfMessage - reject
^https?:\/\/api\.zhuishushenqi\.com\/notification\/shelfMessage - reject
^https?:\/\/api\.zhuishushenqi\.com\/recommend - reject
^https?:\/\/api\.zhuishushenqi\.com\/splashes\/ios - reject
^https?:\/\/api\.zhuishushenqi\.com\/user\/bookshelf-updated - reject
^https?:\/\/b\.zhuishushenqi\.com\/advert - reject
^https?:\/\/dspsdk\.abreader\.com\/v\d\/api\/ad\? - reject
^https?:\/\/itunes\.apple\.com\/lookup\?id=575826903 - reject
^https?:\/\/mi\.gdt\.qq\.com\/gdt_mview\.fcg - reject

[Host]
ip6-localhost = ::1
ip6-loopback = ::1
doh.pub = server:119.29.29.29
taobao.com = server:223.6.6.6
*.taobao.com = server:223.6.6.6
tmall.com = server:223.6.6.6
*.tmall.com = server:223.6.6.6
jd.com = server:119.29.29.29
*.jd.com = server:119.28.28.28
*.qq.com = server:119.28.28.28
*.tencent.com = server:119.28.28.28
*.alicdn.com = server:223.5.5.5
aliyun.com = server:223.5.5.5
*.aliyun.com = server:223.5.5.5
weixin.com = server:119.28.28.28
*.weixin.com = server:119.28.28.28
bilibili.com = server:119.29.29.29
*.bilibili.com = server:119.29.29.29
hdslb.com = server:119.29.29.29
163.com = server:119.29.29.29
*.163.com = server:119.29.29.29
126.com = server:119.29.29.29
*.126.com = server:119.29.29.29
*.126.net = server:119.29.29.29
*.127.net = server:119.29.29.29
*.netease.com = server:119.29.29.29
mi.com = server:119.29.29.29
*.mi.com = server:119.29.29.29
xiaomi.com = server:119.29.29.29
*.xiaomi.com = server:119.29.29.29
routerlogin.net = server:system
_hotspot_.m2m = server:system
router.asus.com = server:system
hotspot.cslwifi.com = server:system
amplifi.lan = server:system
*.lan = server:system

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,223.6.6.6,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]
DOMAIN,vps.hosting,✅ 手动切换
DOMAIN,chat.openai.com,✅ 手动切换
[Remote Rule]



[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}