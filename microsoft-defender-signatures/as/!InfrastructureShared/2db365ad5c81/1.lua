-- Threat: !InfrastructureShared
-- Name: 2db365ad5c81
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\utilman.exe$") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\systray.exe$") then
  local l_0_1 = versioning.GetOrgID()
  if l_0_1 ~= nil and string.lower(l_0_1) == "a58b13d8-a8f3-4b11-b655-2d93970f6374" then
    return mp.CLEAN
  end
end
if string.sub(l_0_0, -17) == "\\artiswitcher.exe" then
  local l_0_2 = versioning.GetOrgID()
  if l_0_2 ~= nil and string.lower(l_0_2) == "9eec8e1d-cecc-44ba-bb08-5e505deb0fe6" then
    return mp.CLEAN
  end
end
local l_0_3 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_4 = sysio.GetProcessFromFileName(l_0_3)
if l_0_4 == nil or #l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\utilman.exe")
if l_0_5 ~= nil then
  local l_0_6 = sysio.GetRegValueAsString(l_0_5, "Debugger")
  if l_0_6 == nil or string.len(l_0_6) <= 1 then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_7, l_0_8 = bm.get_process_relationships()
for l_0_9, l_0_10 in ipairs(l_0_7) do
  if l_0_10.image_path ~= nil and string.find(string.lower(l_0_10.image_path), "winlogon.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
