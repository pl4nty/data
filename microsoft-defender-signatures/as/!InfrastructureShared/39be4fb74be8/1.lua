-- Threat: !InfrastructureShared
-- Name: 39be4fb74be8
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Airpush.B")
  return mp.INFECTED
end
return mp.LOWFI
