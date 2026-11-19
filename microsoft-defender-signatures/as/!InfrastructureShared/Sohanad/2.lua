-- Threat: !InfrastructureShared
-- Name: Sohanad
-- Type: 15

local l_0_0 = Remediation.Threat.Name

local function l_0_1(l_1_0)
  return "0" <= l_1_0 and l_1_0 <= "9" or "A" <= l_1_0 and l_1_0 <= "Z" or "a" <= l_1_0 and l_1_0 <= "z"
end

local function l_0_2(l_2_0, l_2_1, l_2_2)
  if type(l_2_0) ~= "string" then
    return false
  end
  local l_2_3, l_2_4 = string.find(l_2_0, l_2_1, 1, true)
  while l_2_3 do
    if not l_2_2 or l_2_3 == 1 then
      local l_2_5 = string.sub(l_2_0, l_2_4 + 1, l_2_4 + 1)
      if l_2_5 == "" or not l_0_1(l_2_5) then
        return true
      end
    end
    if l_2_2 then
      return false
    end
    l_2_3, l_2_4 = string.find(l_2_0, l_2_1, l_2_3 + 1, true)
  end
  return false
end

if l_0_2(l_0_0, "/Sohanad", false) then
  local l_0_3 = {
    "%windir%\\system32\\setting.ini",
    "%windir%\\system32\\autorun.ini"
  }
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6 = MpCommon.ExpandEnvironmentVariables(l_0_5)
    if l_0_6 then
      sysio.DeleteFile(l_0_6)
    end
  end
  local l_0_7 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon")
  if l_0_7 then
    sysio.SetRegValueAsString(l_0_7, "Shell", "explorer.exe")
  end
  local l_0_8 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System")
  if l_0_8 then
    for l_0_9, l_0_10 in pairs(l_0_8) do
      local l_0_11 = sysio.RegOpenKey(l_0_10)
      if l_0_11 then
        sysio.DeleteRegValue(l_0_11, "DisableTaskMgr")
      end
    end
  end
end
if l_0_2(l_0_0, "Worm:Win32/Sohanad", true) then
  local l_0_12 = Remediation.Threat.Resources or {}
  for l_0_13, l_0_14 in ipairs(l_0_12) do
    if l_0_14.Schema == "file" and l_0_14.Path then
      local l_0_15 = string.match(l_0_14.Path, "^(.+\\)")
      if l_0_15 then
        sysio.DeleteFile(l_0_15 .. "autorun.inf")
      end
    end
  end
end
