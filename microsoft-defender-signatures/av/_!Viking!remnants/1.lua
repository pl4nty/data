-- Threat: \xb0!Viking!remnants
-- Type: 8

if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 11822 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData, 384)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 384)
if l_0_1 ~= 4178240745 then
  return mp.CLEAN
end
return mp.INFECTED
