-- Threat: !InfrastructureShared
-- Name: 618d968ddb0d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Refog.F")
  return mp.INFECTED
end
return mp.LOWFI
