-- Threat: !InfrastructureShared
-- Name: a9be40ee18f7
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Inoco.B")
  return mp.INFECTED
end
return mp.LOWFI
