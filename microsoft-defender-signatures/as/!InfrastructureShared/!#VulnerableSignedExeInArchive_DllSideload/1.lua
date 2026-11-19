-- Threat: !InfrastructureShared
-- Name: !#VulnerableSignedExeInArchive_DllSideload
-- Type: 10
-- MpAttributes: AGGR:SignedExecInArchive

local l_0_0 = pe.get_versioninfo()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.LegalCopyright
if l_0_1 and string.find(string.lower(l_0_1), "asus", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
