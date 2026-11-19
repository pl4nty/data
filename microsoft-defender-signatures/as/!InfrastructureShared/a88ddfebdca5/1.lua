-- Threat: !InfrastructureShared
-- Name: a88ddfebdca5
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Bundlore.CL")
  return mp.INFECTED
end
return mp.LOWFI
