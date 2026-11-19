-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftContextualDropSvchostTemp.B
-- Type: 11

if mp.get_mpattribute("Lua:ContextualDropSvchostTemp.B") then
  return mp.LOWFI
end
return mp.CLEAN
