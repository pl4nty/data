-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftContextualDropIETemp
-- Type: 11

if mp.get_mpattribute("RPF:ContextualDropIETemp") then
  return mp.LOWFI
end
return mp.CLEAN
