-- Threat: !InfrastructureShared
-- Name: MsSenseComponentTamper
-- Type: 14
-- Includes: BMLuaLib, LuaFuncHelper

if Remediation ~= nil and Remediation.Threat ~= nil and Remediation.Threat.Name ~= nil and string.match(Remediation.Threat.Name, "Behavior:Win32/MsSenseComponentTamper.A") then
  local l_0_0 = "BmMsSenseComponentTamperA"
  local l_0_1 = GetRollingQueue(l_0_0)
  if not isnull(l_0_1) then
    for l_0_2 in pairs(l_0_1) do
      local l_0_3 = l_0_1[l_0_2].key
      if l_0_3 ~= nil and sysio.IsFileExists(l_0_3) then
        local l_0_4 = l_0_1[l_0_2].value
        if l_0_4 ~= nil and StringEndsWith(string.lower(l_0_4), ":\\program files\\windows defender advanced threat protection\\mssense.dll") then
          sysio.MoveFile(l_0_3, l_0_4)
          local l_0_5 = "O:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464D:P(A;;FA;;;S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464)(A;;GRGX;;;S-1-15-2-1)(A;;GRGX;;;S-1-15-2-2)(A;;GRGX;;;S-1-5-18)(A;;GRGX;;;S-1-5-32-544)(A;;GRGX;;;S-1-5-32-545)"
          sysio.ApplyFsSddl(l_0_4, l_0_5, false, false)
          break
        end
      end
    end
    EraseRollingQueue(l_0_0)
  end
end
