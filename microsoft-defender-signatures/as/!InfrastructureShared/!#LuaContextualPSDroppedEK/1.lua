-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualPSDroppedEK
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.find(l_0_1, "^[a-z]%.exe$") then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "powershell.exe" then
      mp.set_mpattribute("Lua:ContextualPSDroppedEK")
    end
  end
end
return mp.CLEAN
