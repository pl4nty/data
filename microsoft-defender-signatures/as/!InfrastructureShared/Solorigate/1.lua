-- Threat: !InfrastructureShared
-- Name: Solorigate
-- Type: 14

function split_path(l_1_0)
  return string.match(l_1_0, "(.-)([^\\]-([^\\%.]+))$")
end

if string.find(Remediation.Threat.Name, "^Trojan:MSIL/Solorigate.BR!dha") == nil then
  return
end
for l_0_0, l_0_1 in ipairs(Remediation.Threat.Resources) do
  if l_0_1.Schema == "file" and l_0_1.Path ~= nil and l_0_1.Path ~= "" then
    local l_0_2 = string.lower(l_0_1.Path)
    if l_0_2 ~= nil and 4 < #l_0_2 and string.sub(l_0_2, -4) == ".dll" then
      if string.sub(l_0_2, 1, 4) == "\\\\?\\" then
        l_0_2 = string.sub(l_0_2, 5)
      end
      local l_0_3, l_0_4, l_0_5 = split_path(l_0_2)
      local l_0_6 = {
        "solarwinds.businesslayerhost.exe",
        "configurationwizard.exe"
      }
      for l_0_7, l_0_8 in pairs(l_0_6) do
        local l_0_9 = sysio.GetProcessFromFileName(l_0_3 .. l_0_8)
        for l_0_10, l_0_11 in pairs(l_0_9) do
          local l_0_12 = string.format("pid:%d,ProcessStart:%u", l_0_11.pid, l_0_11.starttime)
          local l_0_13 = sysio.IsFileOpenedByProcess(l_0_12, l_0_2)
          if sysio.GetLastResult().Success == true and l_0_13 == true then
            sysio.StopService("OrionModuleEngine")
            sysio.TerminateProcess(l_0_12)
          end
        end
      end
    end
  end
end
