-- Threat: !InfrastructureShared
-- Name: 898dc7b8f69b
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Bundlore.F")
  return mp.INFECTED
end
return mp.LOWFI
