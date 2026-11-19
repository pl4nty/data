-- Threat: !InfrastructureShared
-- Name: f58dba74be65
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Pirrit.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
