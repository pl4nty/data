-- Threat: !InfrastructureShared
-- Name: Dorkbot
-- Type: 15

function split_path(l_1_0)
  return string.match(l_1_0, "(.-)([^\\]-([^\\%.]+))$")
end

function IsDorkbotPath(l_2_0)
  if l_2_0 == nil then
    return false
  end
  local l_2_1 = string.lower(l_2_0)
  if string.find(l_2_1, "\\temp\\adobe\\reader_sl%.exe$") ~= nil or string.find(l_2_1, "\\temp\\c731200$") ~= nil then
    return true
  end
  if string.find(l_2_1, "\\application data\\screensaverpro%.scr$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\screensaverpro%.scr$") ~= nil or string.find(l_2_1, "\\application data\\c731200$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\c731200$") ~= nil or string.find(l_2_1, "\\application data\\temp%.bin$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\temp%.bin$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\update\\update%.exe$") ~= nil or string.find(l_2_1, "\\application data\\update\\update%.exe$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\update\\explorer%.exe$") ~= nil or string.find(l_2_1, "\\application data\\update\\explorer%.exe$") ~= nil or string.find(l_2_1, "\\appdata\\roaming\\windowsupdate\\updater%.exe$") ~= nil or string.find(l_2_1, "\\application data\\windowsupdate\\updater%.exe$") ~= nil then
    return true
  end
  local l_2_2, l_2_3, l_2_4 = split_path(l_2_0)
  if l_2_4 ~= "exe" and l_2_4 ~= "scr" then
    return false
  end
  if (string.find(string.lower(l_2_2), "\\application data\\identities\\$") ~= nil or string.find(string.lower(l_2_2), "\\appdata\\roaming\\identities\\$") ~= nil or string.find(string.lower(l_2_2), "\\appdata\\roaming\\microsoft\\windows\\themes\\$") ~= nil) and string.find(l_2_3, "%u%l%l%l%l%l%.exe$") ~= nil then
    return true
  end
  return false
end

function DeleteAutoRunEntries(l_3_0)
  if l_3_0 then
    local l_3_1 = sysio.RegEnumValues(l_3_0)
    for l_3_2, l_3_3 in pairs(l_3_1) do
      if l_3_3 then
        local l_3_4 = sysio.GetRegValueAsString(l_3_0, l_3_3)
        if l_3_4 and IsDorkbotPath(l_3_4) == true then
          sysio.DeleteRegValue(l_3_0, l_3_3)
          if sysio.IsFileExists(l_3_4) then
            Remediation.BtrDeleteFile(l_3_4)
          end
        end
      end
    end
  end
end

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Win32/Dorkbot") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    DeleteAutoRunEntries(l_0_3)
  end
end
