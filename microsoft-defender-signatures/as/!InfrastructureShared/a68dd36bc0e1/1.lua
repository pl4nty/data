-- Threat: !InfrastructureShared
-- Name: a68dd36bc0e1
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundlore.C")
  return mp.INFECTED
end
return mp.LOWFI
