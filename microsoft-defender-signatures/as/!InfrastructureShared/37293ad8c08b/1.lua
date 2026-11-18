-- Threat: !InfrastructureShared
-- Name: 37293ad8c08b
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
addDisruptionInfo(true)
return mp.INFECTED
