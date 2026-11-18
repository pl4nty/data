-- Threat: !InfrastructureShared
-- Name: !#BM_RansomNote:Gen.D
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE & (Lua:TXTExt | Lua:HTMExt | Lua:HTMLExt | Lua:HTAExt | BM_HasRansomNoteString)

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 8192 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat1")
local l_0_2 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat2")
if 1 <= #l_0_1 or 6 <= #l_0_1 + #l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat1")
local l_0_4 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat2")
local l_0_5 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat3")
local l_0_6 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat4")
local l_0_7 = #l_0_3 + #l_0_4
if l_0_7 == 0 or #l_0_5 == 0 or #l_0_6 <= 1 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1596 then
  return mp.CLEAN
end
local l_0_8 = tostring(headerpage)
local l_0_9 = {
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
  everything = 20,
  security = 20,
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
  video = 20
}
local l_0_10 = 0
local l_0_11 = 0
for l_0_12, l_0_13 in pairs(l_0_9) do
  local l_0_14 = 0
  local l_0_15 = 0
  while true do
    l_0_14 = string.find(l_0_8, l_0_12, l_0_14 + 1)
    if l_0_14 == nil then
      break
    end
    if l_0_15 == 0 then
      l_0_11 = l_0_11 + 1
    end
    l_0_10 = l_0_10 + l_0_13
    l_0_15 = l_0_15 + 1
    if l_0_15 == 5 then
      break
    end
  end
end
if 2500 <= l_0_10 and 10 <= l_0_11 then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
