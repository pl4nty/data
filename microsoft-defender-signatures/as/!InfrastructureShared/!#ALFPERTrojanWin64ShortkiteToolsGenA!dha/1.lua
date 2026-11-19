-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/ShortkiteTools.Gen.A!dha
-- Type: 10
-- MpAttributes: pea_hasexports

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 26214400 < l_0_0 then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 1 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_2 == nil or l_0_1 ~= 1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = pe.mmap_string_rva(l_0_2[1].namerva, 64)
if l_0_3 ~= nil and string.lower(l_0_3) == "?fdread@@ya_kpeax@z" then
  return mp.INFECTED
end
return mp.CLEAN
