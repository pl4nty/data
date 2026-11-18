-- Threat: !InfrastructureShared
-- Name: 5578b391c827
-- Type: 21

if not peattributes.isvbnative and not peattributes.isvbpcode then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  "mpolkiujhy",
  "gtfrdeszde",
  "jukihygtfe",
  "ioknhbgvfc",
  "fvfderfzdt",
  "loihytgvfd",
  "juigvbcfdx",
  "gytvbncvgk",
  "rfgtedfr",
  "loofnbdfe",
  "ujtgyhrftgc",
  "hytgfredcv",
  "mpolikjutd",
  "ggergherh",
  "kiyhencujf",
  "loiefghbvf",
  "thrthrthrth",
  "mlohytbnhg",
  "utrthrth"
}
local l_0_2
for l_0_3 = 1, #l_0_1 do
  l_0_2 = l_0_1[l_0_3]
  if l_0_0.CompanyName == l_0_2 then
    return mp.INFECTED
  end
end
l_0_1 = {
  "asecfrgvtfd",
  "frdehtjykuh",
  "bgvfcdxserd",
  "edtfvgbhnju",
  "fgdrsedcfvd",
  "ireeghjkrdy",
  "juinbvfgtrd",
  "lkgbvcrtffr",
  "adesfrgtcvbee",
  "dfgtyhnjhgf",
  "afuhjikrgbfv",
  "ujhytgfvbng",
  "mposednhytf",
  "ggergbbneghe",
  "kafujncriut",
  "yhgtfnhytgfn",
  "hezezeezffzf",
  "hujybgvgfcd",
  "hhrthrthr"
}
for l_0_4 = 1, #l_0_1 do
  l_0_2 = l_0_1[l_0_4]
  if l_0_0.ProductName == l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
