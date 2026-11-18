-- Threat: !InfrastructureShared
-- Name: 5d8d58a6f91d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.F")
  return mp.INFECTED
end
return mp.LOWFI
