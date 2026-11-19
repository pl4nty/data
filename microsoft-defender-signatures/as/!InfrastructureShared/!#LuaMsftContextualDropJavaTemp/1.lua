-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftContextualDropJavaTemp
-- Type: 11

if mp.get_mpattribute("RPF:ContextualDropJavaTemp") then
  return mp.LOWFI
end
return mp.CLEAN
