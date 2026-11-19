-- Threat: !InfrastructureShared
-- Name: 19b382b28b74
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_1 = sysio.GetProcessFromFileName(l_0_0)
if l_0_1 ~= nil and 2 <= #l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
