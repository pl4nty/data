-- Threat: !InfrastructureShared
-- Name: 2db3541c9ebe
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_1 = sysio.GetProcessFromFileName(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
return mp.INFECTED
