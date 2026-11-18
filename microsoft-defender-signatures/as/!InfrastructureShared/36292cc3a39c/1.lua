-- Threat: !InfrastructureShared
-- Name: 36292cc3a39c
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
addDisruptionInfo(true)
return mp.INFECTED
