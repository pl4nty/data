-- Threat: !InfrastructureShared
-- Name: !#Lua:FRSTExclusion.A
-- Type: 12
-- MpAttributes: MpIsWmiAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1:find("frst64.exe", 1, true) or l_0_1:find("frstenglish.exe", 1, true) or l_0_1:find("wsmprovhost.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
