-- Threat: !InfrastructureShared
-- Name: 928de8081ce1
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Bundlore.S")
  return mp.INFECTED
end
return mp.LOWFI
