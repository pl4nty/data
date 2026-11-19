-- Threat: !InfrastructureShared
-- Name: 2db36e87e1ca
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_1 = sysio.GetProcessFromFileName(l_0_0)
if l_0_1 ~= nil and 2 <= #l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
