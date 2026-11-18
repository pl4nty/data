-- Threat: !InfrastructureShared
-- Name: 6a8d816434d7
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:DirectHW.B")
  return mp.INFECTED
end
return mp.LOWFI
