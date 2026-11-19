-- Threat: !InfrastructureShared
-- Name: !#Lua:DelphiHeuristicsThrottle
-- Type: 8

if peattributes.isexe then
  mp.set_mpattribute("Lua:DelphiHeuristicsThrottle")
end
return mp.CLEAN
