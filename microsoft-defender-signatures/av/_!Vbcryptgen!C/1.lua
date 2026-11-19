-- Threat: \xcc!Vbcrypt.gen!C
-- Type: 8

if pesecs[pehdr.NumberOfSections].NameDW ~= 1769366830 then
  return mp.CLEAN
end
if peattributes.epscn_islast == true then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData, 10)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 10)
if l_0_1 ~= 1460480634 then
  return mp.CLEAN
end
return mp.INFECTED
