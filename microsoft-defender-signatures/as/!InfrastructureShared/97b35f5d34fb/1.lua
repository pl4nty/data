-- Threat: !InfrastructureShared
-- Name: 97b35f5d34fb
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 and (string.find(l_0_0, "/chrome_crashpad_handler", 1, true) or string.find(l_0_0, "/galaxy-services/", 1, true)) then
  return mp.CLEAN
end
TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED
