-- Threat: !InfrastructureShared
-- Name: 43b34c665da0
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if not IsKeyInRollingQueue("PowershellAMSIpatch_Bytes", "Bytes", true) then
  return mp.CLEAN
end
local l_0_0 = GetRollingQueueKeyValue("PowershellAMSIpatch_Bytes", "Bytes")
if isnull(l_0_0) then
  return mp.CLEAN
end
bm.add_related_string("AMSIBYTES:", l_0_0, bm.RelatedStringBMReport)
pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch_Bytes")
return mp.INFECTED
