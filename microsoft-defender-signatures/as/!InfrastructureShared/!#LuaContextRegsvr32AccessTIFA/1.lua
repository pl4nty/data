-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextRegsvr32AccessTIF.A
-- Type: 9

if peattributes.isdll then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_1:find("\\appdata\\local\\microsoft\\windows\\temporary internet files", 1, true) ~= nil or l_0_1:find("\\appdata\\local\\microsoft\\windows\\inetcache", 1, true) ~= nil then
      local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
      if l_0_2 == "regsvr32.exe" then
        mp.set_mpattribute("Lua:ContextRegsvr32AccessTIF.A")
      elseif l_0_2 == "control.exe" then
        mp.set_mpattribute("Lua:ContextControlAccessTIF.A")
      end
    end
  end
end
return mp.CLEAN
