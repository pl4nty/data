-- Threat: !InfrastructureShared
-- Name: 297821654ee3
-- Type: 21

if pehdr.NumberOfSections < 5 or pesecs[1].SizeOfRawData < 249856 or pehdr.MajorImageVersion ~= 0 or pehdr.MinorImageVersion ~= 0 then
  return mp.CLEAN
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
if l_0_0 + 2048 > mp.getfilesize() then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0, 12)
local l_0_2 = {
  88,
  77,
  67,
  70,
  1,
  0,
  0,
  0,
  90,
  66,
  76,
  0
}
for l_0_3 = 1, 12 do
  if string.byte(l_0_1, l_0_3) ~= l_0_2[l_0_3] then
    return mp.CLEAN
  end
end
return mp.INFECTED
