-- Threat: \x8fHabbo.A
-- Type: 8

if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].VirtualSize ~= 12 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData ~= 4096 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[1].PointerToRawData + 112, 768)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 80)
if l_0_1 ~= 777479262 then
  return mp.CLEAN
end
local l_0_2 = mp.crc32(-1, l_0_0, 391, 224)
if l_0_2 ~= 2819275930 then
  return mp.CLEAN
end
return mp.INFECTED
