-- Threat: !InfrastructureShared
-- Name: 4dbe22e9b7ce
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Airpush.A")
  return mp.INFECTED
end
return mp.LOWFI
