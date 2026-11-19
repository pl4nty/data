-- Threat: !InfrastructureShared
-- Name: Kelihos
-- Type: 15

function string_starts(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

function RemoveKelihosASEPS(l_2_0)
  local l_2_1 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
  if l_2_1 then
    local l_2_2 = sysio.RegEnumValues(l_2_1)
    for l_2_3, l_2_4 in pairs(l_2_2) do
      local l_2_5 = string.lower(sysio.GetRegValueAsString(l_2_1, l_2_4))
      if l_2_5 and l_2_5 == l_2_0 then
        local l_2_6 = {
          "media",
          "video",
          "tray",
          "desktop",
          "icon",
          "folder",
          "database",
          "connection",
          "crashreport",
          "time",
          "network"
        }
        local l_2_7 = {
          "updater",
          "checker",
          "notifyer",
          "saver",
          "verifyer",
          "informer"
        }
        local l_2_8 = #l_2_6
        local l_2_9 = #l_2_7
        for l_2_10 = 1, l_2_8 do
          if string_starts(string.lower(l_2_4), l_2_6[l_2_10]) then
            for l_2_11 = 1, l_2_9 do
              if string_starts(string.sub(string.lower(l_2_4), string.len(l_2_6[l_2_10]) + 1), l_2_7[l_2_11]) then
                sysio.DeleteRegValue(l_2_1, l_2_4)
                sysio.DeleteFile(l_2_5)
              end
            end
          end
        end
      end
    end
  end
end

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Win32/Kelihos") then
  for l_0_0, l_0_1 in pairs(Remediation.Threat.Resources) do
    if l_0_1.Schema == "process" then
      local l_0_2 = sysio.GetFileNameFromProcess(l_0_1.Path)
      if l_0_2 ~= nil then
        RemoveKelihosASEPS(string.lower(l_0_2))
      end
    end
  end
end
