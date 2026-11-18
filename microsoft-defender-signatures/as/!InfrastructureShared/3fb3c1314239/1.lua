-- Threat: !InfrastructureShared
-- Name: 3fb3c1314239
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\atbroker.exe$") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_2 = sysio.GetProcessFromFileName(l_0_1)
if l_0_2 == nil or 1 <= #l_0_2 then
  return mp.CLEAN
end
local l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\atbroker.exe")
if l_0_3 ~= nil then
  local l_0_4 = sysio.GetRegValueAsString(l_0_3, "Debugger")
  if l_0_4 ~= nil and 1 <= string.len(l_0_4) then
    if sysio.IsFileExists(l_0_4) then
      mp.ReportLowfi(l_0_4, 150658937)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
