-- Threat: !InfrastructureShared
-- Name: 8b8d9b0e7745
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.T")
  return mp.INFECTED
end
return mp.LOWFI
