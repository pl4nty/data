-- Threat: !InfrastructureShared
-- Name: BaseFileEncrypt
-- Type: 14

if Remediation.Threat.Name == "Trojan:Win32/BaseFileEncrypt.A" or Remediation.Threat.Name == "Trojan:Win32/BaseFileEncrypt.B" or Remediation.Threat.Name == "Trojan:Win32/BaseFileEncrypt.C" then
  local l_0_0 = versioning.GetOrgID()
  if l_0_0 ~= nil then
    local l_0_1
    for l_0_2, l_0_3 in ipairs(Remediation.Threat.Resources) do
      if l_0_3.Schema == "process" and l_0_3.Path ~= nil and l_0_3.Path ~= "" then
        l_0_1 = string.lower(l_0_3.Path)
        if string.sub(l_0_1, 1, 4) == "\\\\?\\" then
          l_0_1 = string.sub(l_0_1, 5)
        end
        if l_0_1 ~= nil and 1 < #l_0_1 and string.find(l_0_1, ":\\windows\\", 1, true) == nil then
          local l_0_4 = sysio.GetProcessFromFileName(l_0_1)
          for l_0_5, l_0_6 in pairs(l_0_4) do
            local l_0_7 = string.format("pid:%d,ProcessStart:%u", l_0_6.pid, l_0_6.starttime)
            sysio.TerminateProcess(l_0_7)
          end
        end
      end
    end
  end
end
