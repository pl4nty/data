-- Threat: !InfrastructureShared
-- Name: !#BM_RansomNote:Gen.E
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE & (Lua:TXTExt | Lua:HTMExt | Lua:HTMLExt | Lua:HTAExt | BM_HasRansomNoteString)

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 8192 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat1")
local l_0_2 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat2")
local l_0_3 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat3")
if 1 <= #l_0_1 or 6 <= #l_0_1 + #l_0_2 or 3 <= #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat1")
local l_0_5 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat2")
local l_0_6 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat3")
local l_0_7 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat4")
local l_0_8 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat5")
local l_0_9 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat6")
local l_0_10 = #l_0_4 + #l_0_5
if l_0_10 == 0 or #l_0_6 == 0 or #l_0_7 + #l_0_8 + #l_0_9 <= 2 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1596 then
  return mp.CLEAN
end
local l_0_11 = tostring(headerpage)
local l_0_12 = {
  infect = 500,
  ransom = 500,
  attack = 200,
  corrupt = 200,
  damage = 200,
  locked = 200,
  payment = 200,
  purchase = 200,
  recover = 200,
  restore = 200,
  secret = 200,
  hacked = 100,
  ["buy bitcoins"] = 500,
  ["decrypt data"] = 500,
  ["decrypt files"] = 500,
  ["decryption tool"] = 500,
  ["encrypted files"] = 500,
  ["files encrypted"] = 500,
  onion = 500,
  ["recover files"] = 500,
  ["restore files"] = 500,
  ["aes-128"] = 200,
  bitcoin = 200,
  ["rsa-1024"] = 200,
  ["rsa-2048"] = 200,
  ["send decryption"] = 200,
  ["tor browser"] = 200,
  ["tor project"] = 200,
  torbrowser = 200,
  ["tor-browser"] = 200,
  wallet = 200,
  ["aes 128"] = 100,
  ["aes 256"] = 100,
  ["aes-256"] = 100,
  ["airmail.cc"] = 100,
  ["bitmessage.ch"] = 100,
  cipher = 100,
  cryptocurrencies = 100,
  ["cryptography algorithm"] = 100,
  cryptosystem = 100,
  extension = 100,
  ["firemail.cc"] = 100,
  guarantee = 100,
  ["important files"] = 100,
  ["mail.ch"] = 100,
  ["private key"] = 100,
  protonmail = 100,
  ["rsa 1024"] = 100,
  ["rsa 2048"] = 100,
  ["tuta.io"] = 100,
  tutanota = 100,
  ["return files"] = 50,
  ["third part"] = 50,
  ["third-part"] = 50,
  ["write email"] = 50,
  weakness = 20,
  decryption = 100,
  encryption = 100,
  overwrite = 100,
  permanent = 100,
  scam = 100,
  unlock = 100,
  ["valuable data"] = 100,
  dropbox = 50,
  encrypted = 50,
  files = 50,
  identification = 50,
  important = 50,
  impossib = 50,
  irrevocably = 50,
  lose = 50,
  paying = 50,
  personal = 50,
  price = 50,
  program = 50,
  shutdown = 50,
  strong = 50,
  warning = 50,
  website = 50,
  assistance = 20,
  attention = 20,
  business = 20,
  chat = 20,
  computer = 20,
  data = 20,
  documents = 20,
  download = 20,
  folder = 20,
  follow = 20,
  free = 20,
  hours = 20,
  https = 20,
  hxxps = 20,
  information = 20,
  install = 20,
  instruction = 20,
  mail = 20,
  money = 20,
  photos = 20,
  possible = 20,
  private = 20,
  problem = 20,
  ["return"] = 20,
  send = 20,
  server = 20,
  software = 20,
  sure = 20,
  time = 20,
  tool = 20,
  unique = 20,
  video = 20,
  danger = 200,
  locker = 100,
  greetings = 20,
  welcome = 20,
  sorry = 100,
  ["what happened"] = 50,
  ["crypto locker"] = 500,
  ["bad news"] = 100,
  ["do not worry"] = 100,
  ["dont worry"] = 100,
  ["contact us"] = 50,
  ["restore file"] = 200,
  ["please be careful"] = 200,
  ["read this text carefully"] = 200,
  ["do not modify"] = 200,
  ["do not delete"] = 200,
  ["do not rename"] = 200,
  ["do not try restore"] = 200,
  decoded = 50,
  ["your network"] = 100,
  ["personal files"] = 200,
  ["all your data"] = 200,
  ["recover my files"] = 200,
  ["bitcoin network"] = 200,
  ["bitcoin wallet"] = 200,
  bitfinex = 200,
  bitpanda = 200,
  bitquick = 200,
  bitstamp = 200,
  bittybot = 200,
  bittylicious = 200,
  btcdirect = 200,
  coinatmradar = 200,
  coinbase = 200,
  coincafe = 200,
  coincorner = 200,
  coindesk = 200,
  coinfinity = 200,
  coinfloor = 200,
  coinhouse = 200,
  coinmama = 200,
  cubits = 200,
  ["file decryption costs money"] = 500,
  ["free decryption"] = 200,
  ["get private key"] = 200,
  ["got hacked"] = 500,
  ["guarantee before paying"] = 500,
  ["guarantee file recovery"] = 500,
  ["guaranteed recovery"] = 500,
  happycoins = 200,
  ["install tor"] = 500,
  ["irrevocably changed"] = 200,
  localbitcoins = 200,
  ["military grade algorithms"] = 500,
  ["much expensive"] = 100,
  ["obtain bitcoins"] = 200,
  ["permanent data loss"] = 200,
  ["permanently deleted"] = 200,
  ["purchase bitcoins"] = 500,
  ["purchase decrypt tool"] = 200,
  ["recovering files"] = 200,
  ["rename encrypted files"] = 200,
  ["military grade encryption"] = 500,
  ["strongest encryption"] = 500,
  ["bad luck"] = 100,
  ["compromised data downloaded"] = 100,
  ["contain valuable data"] = 50,
  ["decryption test"] = 100,
  ["decryptor home page"] = 100,
  ["easiest way"] = 50,
  ["enough time"] = 50,
  ["following steps"] = 50,
  ["may cause increased price"] = 200,
  ["never restore"] = 100,
  ["original files back"] = 100,
  ["payment method"] = 200,
  ["payments history"] = 50,
  paypal = 100,
  ["personal code"] = 100,
  ["personal id"] = 50,
  ["personal identification number"] = 50,
  ["secret server !!!"] = 100,
  ["security problem"] = 50,
  ["special price"] = 100,
  ["specified time"] = 50,
  ["strong encryption"] = 200,
  ["unique key"] = 100,
  ["waste time trying"] = 200,
  ["waste valuable time searching"] = 200,
  ["data using third party software"] = 200,
  ["data within"] = 20,
  ["data without payment"] = 200,
  ["get answer"] = 20,
  ["key file"] = 20,
  ["letter must contain"] = 20,
  ["please follow"] = 50,
  ["please note"] = 50,
  ["please scroll"] = 50,
  ["price depends"] = 100,
  protected = 20,
  ["send one"] = 20,
  ["send us"] = 20,
  ["send us prvkey"] = 200,
  ["software payments"] = 200,
  sooner = 50,
  ["telegram id"] = 20,
  ["total received"] = 20,
  ["trust us"] = 100,
  ["try searching"] = 200,
  ["use free decryption tools"] = 200,
  victim = 100,
  ["within 24 hours"] = 200,
  ["without saving prvkey"] = 200,
  ["write us"] = 20
}
local l_0_13 = 0
local l_0_14 = 0
for l_0_15, l_0_16 in pairs(l_0_12) do
  local l_0_17 = 0
  local l_0_18 = 0
  while true do
    l_0_17 = string.find(l_0_11, l_0_15, l_0_17 + 1)
    if l_0_17 == nil then
      break
    end
    if l_0_18 == 0 then
      l_0_14 = l_0_14 + 1
    end
    l_0_13 = l_0_13 + l_0_16
    l_0_18 = l_0_18 + 1
    if l_0_18 == 5 then
      break
    end
  end
end
if l_0_13 >= 2500 and l_0_14 >= 10 then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
