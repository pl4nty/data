-- Threat: !InfrastructureShared
-- Name: 6dd7275afecf
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = l_0_1:match("([^\\]+)$")
local l_0_3 = "svchost.exe|taskeng.exe|taskhostw.exe"
if l_0_2 ~= nil and not string.find(l_0_3, l_0_2) then
  return mp.CLEAN
end
local l_0_4 = sysio.RegExpandUserKey("HKCU\\Environment")
if l_0_4 then
  for l_0_5, l_0_6 in pairs(l_0_4) do
    local l_0_7 = sysio.RegOpenKey(l_0_6)
    if l_0_7 then
      local l_0_8 = sysio.RegEnumValues(l_0_7)
      for l_0_9, l_0_10 in pairs(l_0_8) do
        if string.lower(l_0_10) == "windir" then
          local l_0_11 = string.lower(sysio.GetRegValueAsString(l_0_7, l_0_10))
          if string.len(l_0_11) > 8 and (string.find(l_0_11, "cmd ", 1, true) or string.find(l_0_11, "cmd.exe", 1, true) or string.find(l_0_11, "powershell", 1, true) or string.find(l_0_11, "wscript", 1, true) or string.find(l_0_11, "cscript", 1, true) or string.find(l_0_11, "schtasks", 1, true) or string.find(l_0_11, "mshta", 1, true) or string.find(l_0_11, "reg add", 1, true) or string.find(l_0_11, "reg.exe add", 1, true) or string.find(l_0_11, "regedit.exe", 1, true) or string.find(l_0_11, "rundll32.exe", 1, true) or string.find(l_0_11, "regsvr32.exe", 1, true) or string.find(l_0_11, "bypass", 1, true) or string.find(l_0_11, "\\appdata\\roaming\\", 1, true) or string.find(l_0_11, "\\appdata\\local\\", 1, true) or string.find(l_0_11, "\\users\\public\\", 1, true) or string.find(l_0_11, "\\programdata\\", 1, true) or string.find(l_0_11, ".bat", 1, true) or string.find(l_0_11, ".cmd", 1, true) or string.find(l_0_11, ".js", 1, true) or string.find(l_0_11, ".vbs", 1, true) or string.find(l_0_11, ".wsf", 1, true)) then
            return mp.INFECTED
          end
          if string.len(l_0_11) > 16 and (string.find(l_0_11, " /c ", 1, true) or string.find(l_0_11, " /k ", 1, true)) then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
