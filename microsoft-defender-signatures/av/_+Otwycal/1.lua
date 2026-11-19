-- Threat: \xb0+Otwycal
-- Type: 8

if pesecs[pehdr.NumberOfSections].NameDW ~= 1129928494 then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData - mp.getfilesize()
if l_0_0 <= 0 then
  return mp.CLEAN
end
local l_0_1 = mp.crc32(-1, epcode, 1, 64)
if l_0_1 ~= 148363345 then
  return mp.CLEAN
end
return mp.INFECTED
