-- Threat: !InfrastructureShared
-- Name: 518dfc2cf8aa
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:SurfBuyer.E")
  return mp.INFECTED
end
return mp.LOWFI
