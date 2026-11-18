-- Threat: !InfrastructureShared
-- Name: 778da0cab5a8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MaxOfferDeal.B")
  return mp.INFECTED
end
return mp.LOWFI
