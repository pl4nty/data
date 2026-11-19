-- Threat: !InfrastructureShared
-- Name: 9c8d75be96a2
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Bundlore.AD")
  return mp.INFECTED
end
return mp.LOWFI
