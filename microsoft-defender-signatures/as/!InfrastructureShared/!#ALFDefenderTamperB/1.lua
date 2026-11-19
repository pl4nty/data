-- Threat: !InfrastructureShared
-- Name: !#ALF:DefenderTamper.B
-- Type: 13
-- MpAttributes: ALF:TamperingDefender.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 ~= nil then
    l_0_1 = string.lower(l_0_1)
    if l_0_1:find("wsmprovhost.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
