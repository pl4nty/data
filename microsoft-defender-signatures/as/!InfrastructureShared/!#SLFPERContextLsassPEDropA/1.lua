-- Threat: !InfrastructureShared
-- Name: !#SLFPER:ContextLsassPEDrop.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if l_0_1 == "lsass.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
