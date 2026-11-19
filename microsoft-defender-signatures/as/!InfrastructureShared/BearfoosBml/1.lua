-- Threat: !InfrastructureShared
-- Name: BearfoosBml
-- Type: 14

if Remediation.Threat.Name == "Trojan:Win32/Bearfoos.B!ml" then
  local l_0_0
  for l_0_1, l_0_2 in ipairs(Remediation.Threat.Resources) do
    if l_0_2.Schema == "process" and l_0_2.Path ~= nil and l_0_2.Path ~= "" then
      l_0_0 = string.lower(l_0_2.Path)
      if string.sub(l_0_0, 1, 4) == "\\\\?\\" then
        l_0_0 = string.sub(l_0_0, 5)
      end
      if l_0_0 ~= nil and 1 < #l_0_0 and string.find(l_0_0, ":\\windows\\", 1, true) == nil and string.find(l_0_0, ":\\program files", 1, true) == nil then
        local l_0_3 = sysio.GetProcessFromFileName(l_0_0)
        for l_0_4, l_0_5 in pairs(l_0_3) do
          local l_0_6 = string.format("pid:%d,ProcessStart:%u", l_0_5.pid, l_0_5.starttime)
          sysio.TerminateProcess(l_0_6)
        end
      end
    end
  end
end
