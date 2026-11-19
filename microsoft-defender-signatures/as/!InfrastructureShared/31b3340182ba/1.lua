-- Threat: !InfrastructureShared
-- Name: 31b3340182ba
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\narrator.exe$") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\systray.exe$") then
  local l_0_1 = versioning.GetOrgID()
  if l_0_1 ~= nil and string.lower(l_0_1) == "a58b13d8-a8f3-4b11-b655-2d93970f6374" then
    return mp.CLEAN
  end
end
local l_0_2 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_3 = sysio.GetProcessFromFileName(l_0_2)
if l_0_3 == nil or #l_0_3 == 0 then
  return mp.CLEAN
end
local l_0_4 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\narrator.exe")
if l_0_4 ~= nil then
  local l_0_5 = sysio.GetRegValueAsString(l_0_4, "Debugger")
  if l_0_5 == nil or string.len(l_0_5) <= 1 then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_6, l_0_7 = bm.get_process_relationships()
for l_0_8, l_0_9 in ipairs(l_0_6) do
  if l_0_9.image_path ~= nil then
    local l_0_10 = string.lower(l_0_9.image_path)
    if string.find(l_0_10, "atbroker.exe", 1, true) or string.find(l_0_10, "utilman.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
