-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/SuspDown.SA
-- Type: 13
-- MpAttributes: SCPT:IWshell_Powershell

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 and l_0_4 ~= nil and string.find(l_0_4, "\\mshta.exe", 1, true) then
      local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if not l_0_5 then
        return mp.CLEAN
      end
      local l_0_6 = string.lower(mp.GetProcessCommandLine(l_0_5))
      if string.find(l_0_6, "http", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
