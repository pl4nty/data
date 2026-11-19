-- Threat: !InfrastructureShared
-- Name: 908d7c2b2a91
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Shopsmart.E")
  return mp.INFECTED
end
return mp.LOWFI
