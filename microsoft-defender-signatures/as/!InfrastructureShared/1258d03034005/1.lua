-- Threat: !InfrastructureShared
-- Name: 1258d03034005
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.O")
  return mp.INFECTED
end
return mp.LOWFI
