-- Threat: !InfrastructureShared
-- Name: Proslikefan
-- Type: 14

if string.match(Remediation.Threat.Name, "Worm:JS/Proslikefan") then
  local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%")
  if l_0_0 then
    local l_0_1 = sysio.GetProcessFromFileName(l_0_0 .. "\\system32\\wscript.exe")
    if l_0_1 then
      for l_0_2, l_0_3 in pairs(l_0_1) do
        local l_0_4 = string.format("pid:%d,ProcessStart:%u", l_0_3.pid, l_0_3.starttime)
        sysio.TerminateProcess(l_0_4)
      end
    end
  end
end
