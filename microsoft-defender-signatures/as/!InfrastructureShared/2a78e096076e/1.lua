-- Threat: !InfrastructureShared
-- Name: 2a78e096076e
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("Lua:DelphiHeuristicsThrottle") then
  return mp.INFECTED
end
return mp.CLEAN
