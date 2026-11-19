-- Threat: !InfrastructureShared
-- Name: 4178e225c30f
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("Lua:DelphiHeuristicsThrottle") then
  return mp.INFECTED
end
return mp.CLEAN
