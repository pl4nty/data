-- Threat: !InfrastructureShared
-- Name: WannaCrypt
-- Type: 17

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%SystemRoot%")
local l_0_1 = MpCommon.ExpandEnvironmentVariables("%temp%")
if l_0_0 then
  MpDetection.ScanResource("folder://" .. l_0_0 .. "\\intel")
end
if l_0_1 then
  MpDetection.ScanResource("folder://" .. l_0_1)
end
