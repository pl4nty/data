-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualIEDroppedEK
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "z.tmp" or l_0_1 == "a.exe" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "iexplore.exe" then
      mp.set_mpattribute("Lua:ContextualIEDroppedEK")
    end
  end
end
return mp.CLEAN
