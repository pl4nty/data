-- Threat: !InfrastructureShared
-- Name: 888d09bd696f
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:MacSearch.A")
end
return mp.LOWFI
