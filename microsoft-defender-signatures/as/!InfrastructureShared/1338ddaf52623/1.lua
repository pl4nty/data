-- Threat: !InfrastructureShared
-- Name: 1338ddaf52623
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.Q")
  return mp.INFECTED
end
return mp.LOWFI
