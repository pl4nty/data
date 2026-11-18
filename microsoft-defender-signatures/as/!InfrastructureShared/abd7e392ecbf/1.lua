-- Threat: !InfrastructureShared
-- Name: abd7e392ecbf
-- Type: 21

local l_0_0 = {}
table.insert(l_0_0, "security")
MpCommon.SetPersistContextNoPath("DumpHive.A!security", l_0_0, 300)
if MpCommon.GetPersistContextCountNoPath("DumpHive.A!system") > 0 or 0 < MpCommon.GetPersistContextCountNoPath("DumpHive.A!sam") then
  return mp.INFECTED
end
return mp.CLEAN
