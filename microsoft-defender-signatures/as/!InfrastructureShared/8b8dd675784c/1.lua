-- Threat: !InfrastructureShared
-- Name: 8b8dd675784c
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Cosmac.A")
  return mp.INFECTED
end
return mp.LOWFI
