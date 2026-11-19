-- Threat: !InfrastructureShared
-- Name: 82bea98865bb
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:OfferAd.A")
  return mp.INFECTED
end
return mp.LOWFI
