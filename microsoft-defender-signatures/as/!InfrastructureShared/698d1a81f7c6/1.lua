-- Threat: !InfrastructureShared
-- Name: 698d1a81f7c6
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:DutyWatch.A")
  return mp.INFECTED
end
return mp.LOWFI
