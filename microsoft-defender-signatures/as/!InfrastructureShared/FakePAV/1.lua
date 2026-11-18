-- Threat: !InfrastructureShared
-- Name: FakePAV
-- Type: 15

if string.match(Remediation.Threat.Name, "FakePAV") then
  local l_0_0 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options"
  local l_0_1 = sysio.RegOpenKey(l_0_0)
  if l_0_1 then
    local l_0_2 = sysio.RegEnumKeys(l_0_1)
    if l_0_2 then
      for l_0_3, l_0_4 in pairs(l_0_2) do
        local l_0_5 = sysio.RegOpenKey(l_0_0 .. "\\" .. l_0_4)
        if l_0_5 then
          sysio.DeleteRegValue(l_0_5, "Debugger")
        end
      end
    end
  end
end
