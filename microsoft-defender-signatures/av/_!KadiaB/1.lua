-- Threat: \xb0!Kadia.B
-- Type: 8

if pesecs[pehdr.NumberOfSections].NameDW ~= 1886610478 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Characteristics ~= 3221225568 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 8192 then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes ~= true then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= false then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData - 309, 39)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 39)
if l_0_1 ~= 2134942568 then
  return mp.CLEAN
end
return mp.INFECTED
