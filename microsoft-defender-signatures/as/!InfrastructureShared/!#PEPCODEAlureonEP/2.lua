-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:AlureonEP
-- Type: 8

if pehdr.NumberOfSections ~= 8 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 151552 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 561) ~= 1651336557 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 23)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 23)
if l_0_1 ~= 1267305419 then
  return mp.CLEAN
end
return mp.INFECTED
