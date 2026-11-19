-- Threat: !InfrastructureShared
-- Name: 8b8d7b287bac
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Conduit.A")
  return mp.INFECTED
end
return mp.LOWFI
