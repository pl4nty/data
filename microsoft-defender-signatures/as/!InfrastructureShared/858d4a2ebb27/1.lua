-- Threat: !InfrastructureShared
-- Name: 858d4a2ebb27
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MaxOfferDeal.A")
  return mp.INFECTED
end
return mp.LOWFI
