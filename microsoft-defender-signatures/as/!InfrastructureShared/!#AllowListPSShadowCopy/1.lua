-- Threat: !InfrastructureShared
-- Name: !#AllowList:PSShadowCopy
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2)
    if string.find(l_0_3, "microsoft intune management extension", 1, true) or string.find(l_0_3, "ccm\\systemtemp", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
