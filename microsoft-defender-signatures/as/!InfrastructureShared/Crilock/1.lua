-- Threat: !InfrastructureShared
-- Name: Crilock
-- Type: 15

function CompareRegValueAndRemove(l_1_0, l_1_1)
  local l_1_2 = sysio.RegOpenKey(l_1_0)
  
  local l_1_3
  if l_1_2 then
    local l_1_4 = sysio.RegEnumValues(l_1_2)
    for l_1_5, l_1_6 in pairs(l_1_4) do
      if l_1_6 then
        l_1_3 = sysio.GetRegValueAsString(l_1_2, l_1_6)
        if l_1_3 then
          l_1_3 = string.lower(l_1_3)
          if string.find(l_1_3, l_1_1, 1, true) then
            sysio.DeleteRegValue(l_1_2, l_1_6)
            return true
          end
        end
      end
    end
  end
  return false
end

if Remediation.Threat.Active then
  local l_0_0, l_0_1
  l_0_0 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  if l_0_0 then
    l_0_1 = sysio.GetRegValueAsString(l_0_0, "cryptolocker")
    if l_0_1 ~= nil then
      sysio.DeleteRegValue(l_0_0, "cryptolocker")
    end
  end
  l_0_0 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce")
  if l_0_0 then
    l_0_1 = sysio.GetRegValueAsString(l_0_0, "*cryptolocker")
    if l_0_1 ~= nil then
      sysio.DeleteRegValue(l_0_0, "*cryptolocker")
    end
  end
  local l_0_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_3, l_0_4 in pairs(l_0_2) do
    l_0_0 = sysio.RegOpenKey(l_0_4)
    if l_0_0 then
      l_0_1 = sysio.GetRegValueAsString(l_0_0, "cryptolocker")
      if l_0_1 ~= nil then
        sysio.DeleteRegValue(l_0_0, "cryptolocker")
      end
    end
  end
  local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce")
  for l_0_6, l_0_7 in pairs(l_0_5) do
    l_0_0 = sysio.RegOpenKey(l_0_7)
    if l_0_0 then
      l_0_1 = sysio.GetRegValueAsString(l_0_0, "*cryptolocker")
      if l_0_1 ~= nil then
        sysio.DeleteRegValue(l_0_0, "*cryptolocker")
      end
    end
  end
  local l_0_8 = "HKCU\\SOFTWARE\\BIT TORRENT APPLICATION\\CONFIGURATION"
  local l_0_9 = sysio.RegExpandUserKey(l_0_8)
  local l_0_10, l_0_11, l_0_12
  for l_0_13, l_0_14 in pairs(l_0_9) do
    l_0_10 = sysio.RegOpenKey(l_0_14)
    if l_0_10 then
      l_0_12 = sysio.RegEnumValues(l_0_10)
      for l_0_15, l_0_16 in pairs(l_0_12) do
        if l_0_16 then
          l_0_11 = sysio.GetRegValueAsString(l_0_10, l_0_16)
          if l_0_11 then
            l_0_11 = string.lower(l_0_11)
            if l_0_11 ~= nil and string.find(l_0_11, ".exe", 1, true) then
              if string.find(l_0_11, "\\windows\\", 1, true) or string.find(l_0_11, "\\programdata\\", 1, true) then
                if not CompareRegValueAndRemove("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", l_0_11) then
                  for l_0_17, l_0_18 in pairs(l_0_2) do
                    if CompareRegValueAndRemove(l_0_18, l_0_11) then
                      break
                    end
                  end
                end
                if sysio.IsFileExists(l_0_11) then
                  MpCommon.ReportLowfi(l_0_11, 1189452850)
                end
              end
              break
            end
          end
        end
      end
    end
  end
end
