-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:AlureonEP
-- Type: 8

if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 24)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 24)
if l_0_1 ~= 1525313111 then
  return mp.CLEAN
end
return mp.INFECTED
