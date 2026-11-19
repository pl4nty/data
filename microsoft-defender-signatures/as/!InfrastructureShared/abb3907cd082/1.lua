-- Threat: !InfrastructureShared
-- Name: abb3907cd082
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%ProgramData%")
if not sysio.IsFolderExists(l_0_0) then
  return mp.CLEAN
end
mp.TriggerScanResource("folder", l_0_0)
return mp.INFECTED
