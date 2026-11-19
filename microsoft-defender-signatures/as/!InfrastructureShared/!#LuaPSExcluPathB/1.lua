-- Threat: !InfrastructureShared
-- Name: !#Lua:PSExcluPath.B
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2)
    if l_0_3:find("getdir_path.ps1", 1, true) or l_0_3:find("windowspowershell\\modules\\", 1, true) or l_0_3:find("ordrsoftwareinventorycollector.ps1", 1, true) or l_0_3:find("appdomainconfig.ps", 1, true) or l_0_3:find("windowspowershell\\modules\\", 1, true) or l_0_3:find("\\powershell\\modules", 1, true) or l_0_3:find("\\ps\\modules\\", 1, true) or l_0_3:find("\\windowspowershell\\v1.0\\module\\", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
