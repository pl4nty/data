-- Threat: !InfrastructureShared
-- Name: a9d790b79eec
-- Type: 21

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Environment")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    if l_0_3 then
      local l_0_4 = sysio.RegEnumValues(l_0_3)
      for l_0_5, l_0_6 in pairs(l_0_4) do
        if string.lower(l_0_6) == "windir" then
          local l_0_7 = string.lower(sysio.GetRegValueAsString(l_0_3, l_0_6))
          if string.len(l_0_7) > 8 and (string.find(l_0_7, "cmd ", 1, true) or string.find(l_0_7, "cmd.exe", 1, true) or string.find(l_0_7, "powershell", 1, true) or string.find(l_0_7, "wscript", 1, true) or string.find(l_0_7, "cscript", 1, true) or string.find(l_0_7, "schtasks", 1, true) or string.find(l_0_7, "mshta", 1, true) or string.find(l_0_7, "reg add", 1, true) or string.find(l_0_7, "reg.exe add", 1, true) or string.find(l_0_7, "regedit.exe", 1, true) or string.find(l_0_7, "rundll32.exe", 1, true) or string.find(l_0_7, "regsvr32.exe", 1, true) or string.find(l_0_7, "bypass", 1, true) or string.find(l_0_7, "\\appdata\\roaming\\", 1, true) or string.find(l_0_7, "\\appdata\\local\\", 1, true) or string.find(l_0_7, "\\users\\public\\", 1, true) or string.find(l_0_7, "\\programdata\\", 1, true) or string.find(l_0_7, ".bat", 1, true) or string.find(l_0_7, ".cmd", 1, true) or string.find(l_0_7, ".js", 1, true) or string.find(l_0_7, ".vbs", 1, true) or string.find(l_0_7, ".wsf", 1, true)) then
            return mp.INFECTED
          end
          if string.len(l_0_7) > 16 and (string.find(l_0_7, " /c ", 1, true) or string.find(l_0_7, " /k ", 1, true)) then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
