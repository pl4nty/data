-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropFlashplayer.A
-- Type: 10

if peattributes.no_ep then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if string.len(l_0_1) < 29 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower((mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)))
  if string.sub(l_0_1, 1, 18) == "flashplayerplugin_" and string.sub(l_0_2, -15) == "\\macromed\\flash" then
    local l_0_3 = "Lua:ContextualDropFlashplayer"
    local l_0_4 = {
      ["flashplayerplugin_19_0_0_185.exe"] = ""
    }
    if l_0_4[l_0_1] then
      l_0_3 = l_0_3 .. "Latest"
    end
    mp.set_mpattribute(l_0_3)
  end
end
return mp.CLEAN
