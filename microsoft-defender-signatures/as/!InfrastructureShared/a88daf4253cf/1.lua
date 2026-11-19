-- Threat: !InfrastructureShared
-- Name: a88daf4253cf
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacBooster.J")
  return mp.INFECTED
end
return mp.LOWFI
