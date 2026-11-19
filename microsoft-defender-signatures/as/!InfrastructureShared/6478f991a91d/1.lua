-- Threat: !InfrastructureShared
-- Name: 6478f991a91d
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("Lua:DelphiHeuristicsThrottle") and mp.getfilesize() < 1843200 then
  return mp.INFECTED
end
return mp.CLEAN
