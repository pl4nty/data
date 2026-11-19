-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropJob
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:find("^security center update - %d%d%d%d%d%d%d%d?%d?%d?%.job$") == 1 then
    mp.set_mpattribute("Lua:ContextualDropJob.A")
  end
end
return mp.CLEAN
