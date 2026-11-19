-- Threat: !InfrastructureShared
-- Name: 2389a680f55d
-- Type: 21

mp.readprotection(false)
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
local l_0_1 = mp.readfile(l_0_0, 60)
local l_0_2 = mp.crc32(-1, l_0_1, 1, 60)
if l_0_2 ~= 2693178178 then
  return mp.CLEAN
end
return mp.INFECTED
