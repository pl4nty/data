-- Threat: !InfrastructureShared
-- Name: a08d5ab7b0c4
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundlore.AE")
  return mp.INFECTED
end
return mp.LOWFI
