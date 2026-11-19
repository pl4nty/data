-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/FakeUpdate.SE
-- Type: 13
-- Includes: TechniqueTracker, BMLuaLib
-- MpAttributes: MpIsAMSIScan & SCPT:Socgolsh.SC1 & (SCPT:Socgolsh.SC2 | SCPT:Socgolsh.SC4) & (SCPT:Socgolsh.SC3 | SCPT:Socgolsh.SC5)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    local l_0_4 = string.lower(mp.GetProcessCommandLine(l_0_3))
    if StringEndsWith(l_0_4, ".js") and contains(l_0_4, {
      "\\downloads\\",
      "\\appdata\\local\\temp\\"
    }) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
