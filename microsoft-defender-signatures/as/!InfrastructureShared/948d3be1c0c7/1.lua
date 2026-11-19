-- Threat: !InfrastructureShared
-- Name: 948d3be1c0c7
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:DutyWatch.B")
  return mp.INFECTED
end
return mp.LOWFI
