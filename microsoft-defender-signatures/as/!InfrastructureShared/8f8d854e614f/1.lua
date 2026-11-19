-- Threat: !InfrastructureShared
-- Name: 8f8d854e614f
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Bundlore.Ya")
  return mp.INFECTED
end
return mp.LOWFI
