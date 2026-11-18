-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftContextualDropIERoaming
-- Type: 11

if mp.get_mpattribute("RPF:ContextualDropIERoaming") then
  return mp.LOWFI
end
return mp.CLEAN
