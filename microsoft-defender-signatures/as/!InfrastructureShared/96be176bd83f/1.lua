-- Threat: !InfrastructureShared
-- Name: 96be176bd83f
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Airpush.D")
  return mp.INFECTED
end
return mp.LOWFI
