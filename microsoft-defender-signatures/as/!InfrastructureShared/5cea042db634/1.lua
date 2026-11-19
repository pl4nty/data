-- Threat: !InfrastructureShared
-- Name: 5cea042db634
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.A")
  return mp.INFECTED
end
return mp.LOWFI
