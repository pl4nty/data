-- Threat: !InfrastructureShared
-- Name: !#Lua:PsCommandlineContext
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 ~= nil and l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_2:find("\\powershell.exe") or l_0_2:find("\\pwsh.exe") then
      local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_3 ~= nil and l_0_4 == nil then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
