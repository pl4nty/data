-- Threat: !InfrastructureShared
-- Name: 17e8d15352b51
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:VSearch!MTB")
  return mp.INFECTED
end
return mp.LOWFI
