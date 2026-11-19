-- Threat: !InfrastructureShared
-- Name: Shetram
-- Type: 14

function scanRunKeysForShetram(l_1_0)
  local l_1_1 = sysio.RegOpenKey(l_1_0)
  
  local l_1_2 = {
    cpuoptimizer = true,
    checkcpu = true,
    radlover = true,
    cpuulover = true,
    superlover = true,
    flaterem = true,
    strdat = true,
    newageishere = true,
    cpunewage = true,
    antishortcutupdate = true,
    antiusbshortcut = true,
    winddowsupdate = true,
    winddowsupdater = true
  }
  if l_1_1 ~= nil then
    local l_1_3 = sysio.RegEnumValues(l_1_1)
    for l_1_4, l_1_5 in pairs(l_1_3) do
      if l_1_5 ~= nil and l_1_2[string.lower(l_1_5)] == true then
        local l_1_6 = string.lower(sysio.GetRegValueAsString(l_1_1, l_1_5))
        if l_1_6 ~= nil then
          for l_1_7 in string.gmatch(l_1_6, ".:\\[^%s\"',:;]+") do
            if string.find(l_1_7, "cmd.exe", 1, true) == nil and string.find(l_1_7, "windows\\system32\\", 1, true) == nil and (string.find(l_1_7, "cpufix.exe", 1, true) ~= nil or string.find(l_1_7, "cpuchecker.exe", 1, true) ~= nil or string.find(l_1_7, "streamer.exe", 1, true) ~= nil or string.find(l_1_7, "radnewage.exe", 1, true) ~= nil or string.find(l_1_7, "antiusb.exe", 1, true) ~= nil or string.find(l_1_7, "cpuage.tnt", 1, true) ~= nil or string.find(l_1_7, "cpuchecker.txt", 1, true) ~= nil or string.find(l_1_7, "stream.txt", 1, true) ~= nil or string.find(l_1_7, "newradage.tnt", 1, true) ~= nil or string.find(l_1_7, "antiusbshortcut.zip", 1, true) ~= nil or string.find(l_1_7, "winddowsupdater.exe", 1, true) ~= nil or string.find(l_1_7, "winddowsupdater.zip", 1, true) ~= nil) and sysio.IsFileExists(l_1_7) ~= nil then
              Remediation.BtrDeleteFile(l_1_7)
            end
          end
        end
        Remediation.BtrDeleteRegValue(l_1_0 .. "\\\\" .. l_1_5)
      end
    end
  end
end

if string.match(string.lower(Remediation.Threat.Name), "shetram") then
  scanRunKeysForShetram("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    scanRunKeysForShetram(l_0_2)
  end
end
