-- Threat: !InfrastructureShared
-- Name: 5978ed5963d7
-- Type: 21

if peattributes.isexe ~= true then
  return mp.LOWFI
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
if l_0_0 + 1 + 38 > mp.getfilesize() then
  mp.changedetectionname(192)
  return mp.SUSPICIOUS
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0, 38)
local l_0_2 = {
  97,
  67,
  102,
  71,
  57,
  50,
  75,
  88,
  50,
  55,
  69,
  104,
  87,
  54,
  67,
  113,
  112,
  99,
  83,
  111,
  52,
  89,
  57,
  52,
  66,
  110,
  85,
  114,
  70,
  109,
  110,
  78,
  107,
  80,
  53,
  69,
  110,
  84
}
for l_0_3 = 1, 38 do
  if string.byte(l_0_1, l_0_3) ~= l_0_2[l_0_3] then
    mp.changedetectionname(192)
    return mp.SUSPICIOUS
  end
end
return mp.INFECTED
