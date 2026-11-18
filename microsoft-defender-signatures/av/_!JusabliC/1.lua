-- Threat: \xb0!Jusabli.C
-- Type: 8

if pesecs[pehdr.NumberOfSections].NameDW ~= 1902667822 then
  return mp.CLEAN
end
if peattributes.epscn_islast == true then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData, 208)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 208)
if l_0_1 ~= 2967643338 then
  return mp.CLEAN
end
return mp.INFECTED
