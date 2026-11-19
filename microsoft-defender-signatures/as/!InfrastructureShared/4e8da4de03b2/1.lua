-- Threat: !InfrastructureShared
-- Name: 4e8da4de03b2
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Synataeb.A")
  return mp.INFECTED
end
return mp.LOWFI
