-- Threat: !InfrastructureShared
-- Name: 88be14b3ce39
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Revmob.B")
  return mp.INFECTED
end
return mp.LOWFI
