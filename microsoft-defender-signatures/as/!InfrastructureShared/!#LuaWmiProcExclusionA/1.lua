-- Threat: !InfrastructureShared
-- Name: !#Lua:WmiProcExclusion.A
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if l_0_1:find("ccmexec.exe", 1, true) or l_0_1:find("tiworker.exe", 1, true) or l_0_1:find("taniumclient.exe", 1, true) or l_0_1:find("lansweeperservice.exe", 1, true) or l_0_1:find("rg_supervision.exe", 1, true) or l_0_1:find("svchost.exe", 1, true) or l_0_1:find("wscript.exe", 1, true) or l_0_1:find("cscript.exe", 1, true) or l_0_1:find("taniumcx.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
