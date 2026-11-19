-- Threat: \xb0%Poson
-- Type: 9

if epcode[1] ~= 232 then
  return mp.CLEAN
end
if mp.bitand(pesecs[pehdr.NumberOfSections].Characteristics, 2701131841) ~= 2701131841 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 4352 then
  return mp.CLEAN
end
local l_0_0 = mp.crc32(-1, fopclog, 1, 5)
if l_0_0 ~= 406984109 then
  return mp.CLEAN
end
return mp.INFECTED
