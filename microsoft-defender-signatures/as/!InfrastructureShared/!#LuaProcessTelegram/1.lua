-- Threat: !InfrastructureShared
-- Name: !#Lua:ProcessTelegram
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_0:lower() == "cmd.exe" then
  mp.set_mpattribute("LUA:RtpProc_cmd")
  return mp.CLEAN
end
if l_0_0:lower() == "telegram.exe" then
  return mp.INFECTED
end
return mp.CLEAN
