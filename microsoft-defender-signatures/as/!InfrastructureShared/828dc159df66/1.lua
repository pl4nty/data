-- Threat: !InfrastructureShared
-- Name: 828dc159df66
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Refog.D")
  return mp.INFECTED
end
return mp.LOWFI
