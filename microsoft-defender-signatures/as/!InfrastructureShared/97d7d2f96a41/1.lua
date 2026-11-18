-- Threat: !InfrastructureShared
-- Name: 97d7d2f96a41
-- Type: 21

local l_0_0 = {}
table.insert(l_0_0, "sam")
MpCommon.SetPersistContextNoPath("DumpHive.A!sam", l_0_0, 300)
if MpCommon.GetPersistContextCountNoPath("DumpHive.A!security") > 0 or 0 < MpCommon.GetPersistContextCountNoPath("DumpHive.A!system") then
  return mp.INFECTED
end
return mp.CLEAN
