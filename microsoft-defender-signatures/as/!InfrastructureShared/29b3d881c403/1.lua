-- Threat: !InfrastructureShared
-- Name: 29b3d881c403
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\sethc.exe$") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\systray.exe$") then
  local l_0_1 = versioning.GetOrgID()
  if l_0_1 ~= nil and string.lower(l_0_1) == "a58b13d8-a8f3-4b11-b655-2d93970f6374" then
    return mp.CLEAN
  end
end
if string.find(l_0_0, "\\system32\\pivpwprompt.exe$") then
  local l_0_2 = versioning.GetOrgID()
  if l_0_2 ~= nil and string.lower(l_0_2) == "206d09a5-f5df-47df-ae09-19aafc19b04f" then
    return mp.CLEAN
  end
end
local l_0_3 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_4 = sysio.GetProcessFromFileName(l_0_3)
if l_0_4 == nil or #l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\sethc.exe")
if l_0_5 ~= nil then
  local l_0_6 = sysio.GetRegValueAsString(l_0_5, "Debugger")
  if l_0_6 ~= nil and string.len(l_0_6) >= 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
