-- Threat: !InfrastructureShared
-- Name: 7abe9a2f0d7a
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Ganlet.B")
  return mp.INFECTED
end
return mp.LOWFI
