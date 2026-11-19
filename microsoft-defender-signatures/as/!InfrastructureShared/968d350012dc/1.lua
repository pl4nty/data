-- Threat: !InfrastructureShared
-- Name: 968d350012dc
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacBooster.M")
  return mp.INFECTED
end
return mp.LOWFI
