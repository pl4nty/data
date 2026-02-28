local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= nil and 8192 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "SCPT:ClnWordsCat1"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SCPT:ClnWordsCat2"
L2_1 = L2_1(L3_1)
L3_1 = #L1_1
if not (1 <= L3_1) then
  L3_1 = #L1_1
  L4_1 = #L2_1
  L3_1 = L3_1 + L4_1
  if not (6 <= L3_1) then
    goto lbl_30
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_30::
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "SCPT:RansomNoteCat1"
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.enum_mpattributesubstring
L5_1 = "SCPT:RansomNoteCat2"
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.enum_mpattributesubstring
L6_1 = "SCPT:RansomNoteCat3"
L5_1 = L5_1(L6_1)
L6_1 = mp
L6_1 = L6_1.enum_mpattributesubstring
L7_1 = "SCPT:RansomNoteCat4"
L6_1 = L6_1(L7_1)
L7_1 = #L3_1
L8_1 = #L4_1
L7_1 = L7_1 + L8_1
if L7_1 ~= 0 then
  L8_1 = #L5_1
  if L8_1 ~= 0 then
    L8_1 = #L6_1
    if not (L8_1 <= 1) then
      goto lbl_60
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_60::
L8_1 = mp
L8_1 = L8_1.HEADERPAGE_SZ
if L8_1 < 1596 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = tostring
L9_1 = headerpage
L8_1 = L8_1(L9_1)
L9_1 = {}
L9_1.infect = 500
L9_1.ransom = 500
L9_1.attack = 200
L9_1.corrupt = 200
L9_1.damage = 200
L9_1.locked = 200
L9_1.payment = 200
L9_1.purchase = 200
L9_1.recover = 200
L9_1.restore = 200
L9_1.secret = 200
L9_1.hacked = 100
L9_1["buy bitcoins"] = 500
L9_1["decrypt data"] = 500
L9_1["decrypt files"] = 500
L9_1["decryption tool"] = 500
L9_1["encrypted files"] = 500
L9_1["files encrypted"] = 500
L9_1.onion = 500
L9_1["recover files"] = 500
L9_1["restore files"] = 500
L9_1["aes-128"] = 200
L9_1.bitcoin = 200
L9_1["rsa-1024"] = 200
L9_1["rsa-2048"] = 200
L9_1["send decryption"] = 200
L9_1["tor browser"] = 200
L9_1["tor project"] = 200
L9_1.torbrowser = 200
L9_1["tor-browser"] = 200
L9_1.wallet = 200
L9_1["aes 128"] = 100
L9_1["aes 256"] = 100
L9_1["aes-256"] = 100
L9_1["airmail.cc"] = 100
L9_1["bitmessage.ch"] = 100
L9_1.cipher = 100
L9_1.cryptocurrencies = 100
L9_1["cryptography algorithm"] = 100
L9_1.cryptosystem = 100
L9_1.extension = 100
L9_1["firemail.cc"] = 100
L9_1.guarantee = 100
L9_1["important files"] = 100
L9_1["mail.ch"] = 100
L9_1["private key"] = 100
L9_1.protonmail = 100
L9_1["rsa 1024"] = 100
L9_1["rsa 2048"] = 100
L9_1["tuta.io"] = 100
L9_1.tutanota = 100
L9_1["return files"] = 50
L9_1["third part"] = 50
L9_1["third-part"] = 50
L9_1["write email"] = 50
L9_1.everything = 20
L9_1.security = 20
L9_1.weakness = 20
L9_1.decryption = 100
L9_1.encryption = 100
L9_1.overwrite = 100
L9_1.permanent = 100
L9_1.scam = 100
L9_1.unlock = 100
L9_1["valuable data"] = 100
L9_1.dropbox = 50
L9_1.encrypted = 50
L9_1.files = 50
L9_1.identification = 50
L9_1.important = 50
L9_1.impossib = 50
L9_1.irrevocably = 50
L9_1.lose = 50
L9_1.paying = 50
L9_1.personal = 50
L9_1.price = 50
L9_1.program = 50
L9_1.shutdown = 50
L9_1.strong = 50
L9_1.warning = 50
L9_1.website = 50
L9_1.assistance = 20
L9_1.attention = 20
L9_1.business = 20
L9_1.chat = 20
L9_1.computer = 20
L9_1.data = 20
L9_1.documents = 20
L9_1.download = 20
L9_1.folder = 20
L9_1.follow = 20
L9_1.free = 20
L9_1.hours = 20
L9_1.https = 20
L9_1.hxxps = 20
L9_1.information = 20
L9_1.install = 20
L9_1.instruction = 20
L9_1.mail = 20
L9_1.money = 20
L9_1.photos = 20
L9_1.possible = 20
L9_1.private = 20
L9_1.problem = 20
L9_1["return"] = 20
L9_1.send = 20
L9_1.server = 20
L9_1.software = 20
L9_1.sure = 20
L9_1.time = 20
L9_1.tool = 20
L9_1.unique = 20
L9_1.video = 20
L10_1 = 0
L11_1 = 0
L12_1 = pairs
L13_1 = L9_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = 0
  L18_1 = 0
  while true do
    L19_1 = string
    L19_1 = L19_1.find
    L20_1 = L8_1
    L21_1 = L15_1
    L22_1 = L17_1 + 1
    L19_1 = L19_1(L20_1, L21_1, L22_1)
    L17_1 = L19_1
    if L17_1 == nil then
      break
    end
    if L18_1 == 0 then
      L11_1 = L11_1 + 1
    end
    L10_1 = L10_1 + L16_1
    L18_1 = L18_1 + 1
    if L18_1 == 5 then
      break
    end
  end
end
if 2500 <= L10_1 and 10 <= L11_1 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "MpDisableCaching"
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
