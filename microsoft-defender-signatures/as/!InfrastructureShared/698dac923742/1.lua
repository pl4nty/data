-- Threat: !InfrastructureShared
-- Name: 698dac923742
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Refog.D")
  return mp.INFECTED
end
return mp.LOWFI
