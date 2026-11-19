-- Threat: !InfrastructureShared
-- Name: 3629f33588aa
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
addDisruptionInfo(true)
return mp.INFECTED
