-- Threat: !InfrastructureShared
-- Name: 5a8d43306a26
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundlore.K")
  return mp.INFECTED
end
return mp.LOWFI
