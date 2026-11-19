-- Threat: \xb0!Zperm.B
-- Type: 9

if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 65535 then
  return mp.CLEAN
end
if 65535 >= pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.crc32(-1, fopclog2, 1, 16)
if l_0_0 ~= 3763490484 then
  return mp.CLEAN
end
return mp.INFECTED
