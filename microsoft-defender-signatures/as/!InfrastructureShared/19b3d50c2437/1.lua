-- Threat: !InfrastructureShared
-- Name: 19b3d50c2437
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_1 = sysio.GetProcessFromFileName(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
return mp.INFECTED
