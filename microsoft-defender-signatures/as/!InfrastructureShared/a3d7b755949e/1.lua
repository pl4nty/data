-- Threat: !InfrastructureShared
-- Name: a3d7b755949e
-- Type: 21

local l_0_0 = {}
table.insert(l_0_0, "system")
MpCommon.SetPersistContextNoPath("DumpHive.A!system", l_0_0, 300)
if MpCommon.GetPersistContextCountNoPath("DumpHive.A!security") > 0 or 0 < MpCommon.GetPersistContextCountNoPath("DumpHive.A!sam") then
  return mp.INFECTED
end
return mp.CLEAN
