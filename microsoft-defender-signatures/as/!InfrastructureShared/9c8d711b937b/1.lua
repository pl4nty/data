-- Threat: !InfrastructureShared
-- Name: 9c8d711b937b
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Xamloader")
  return mp.INFECTED
end
return mp.LOWFI
