-- Threat: !InfrastructureShared
-- Name: 6f8dec869ebe
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Awecleaner.A")
  return mp.INFECTED
end
return mp.LOWFI
