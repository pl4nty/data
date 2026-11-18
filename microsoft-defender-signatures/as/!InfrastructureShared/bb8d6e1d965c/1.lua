-- Threat: !InfrastructureShared
-- Name: bb8d6e1d965c
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacBooster.N")
  return mp.INFECTED
end
return mp.LOWFI
