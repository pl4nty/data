-- Threat: !InfrastructureShared
-- Name: 7f8d6aa7a3fd
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  mp.set_mpattribute("PUA:Block:Bundlore.L")
  return mp.INFECTED
end
return mp.LOWFI
