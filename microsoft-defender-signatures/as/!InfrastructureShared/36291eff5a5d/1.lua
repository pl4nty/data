-- Threat: !InfrastructureShared
-- Name: 36291eff5a5d
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
addDisruptionInfo(true)
return mp.INFECTED
