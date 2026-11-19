-- Threat: !InfrastructureShared
-- Name: 69d748efd5d1
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(MpCommon.GetImagePathFromPid(mp.GetScannedPPID()))
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "RenamedRegExe")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {}
table.insert(l_0_2, "sam")
MpCommon.SetPersistContextNoPath("DumpHive.B!sam", l_0_2, 300)
if MpCommon.GetPersistContextCountNoPath("DumpHive.B!security") > 0 or 0 < MpCommon.GetPersistContextCountNoPath("DumpHive.B!system") then
  return mp.INFECTED
end
return mp.CLEAN
