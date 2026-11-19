-- Threat: !InfrastructureShared
-- Name: !#Lua:InterestringRTPProcess
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  local l_0_2 = {
    ["cscript.exe"] = true,
    ["wscript.exe"] = true,
    ["powershell.exe"] = true,
    ["cmd.exe"] = true
  }
  if l_0_2[l_0_1] == true then
    mp.set_mpattribute("LuaIntproc!" .. l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
