-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/ChippingFin.A!dha
-- Type: 10
-- MpAttributes: pea_hasexports & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilesize()
if l_0_0 < 41943040 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.OriginalFilename
if l_0_2 == nil then
  return mp.CLEAN
end
if string.lower(l_0_2) ~= "zlibwapi.dll" then
  return mp.CLEAN
end
local l_0_3 = pehdr.DataDirectory[1].RVA
mp.readprotection(false)
local l_0_4 = mp.readfile(pe.foffset_rva(l_0_3), 36)
if mp.readu_u32(l_0_4, 25) ~= 137 then
  return mp.CLEAN
end
return mp.INFECTED
