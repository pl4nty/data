-- Threat: !InfrastructureShared
-- Name: 1e781ba9733c
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("Lua:DelphiHeuristicsThrottle") then
  return mp.INFECTED
end
return mp.CLEAN
