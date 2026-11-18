-- Threat: !InfrastructureShared
-- Name: 3729187771ce
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
addDisruptionInfo(true)
return mp.INFECTED
