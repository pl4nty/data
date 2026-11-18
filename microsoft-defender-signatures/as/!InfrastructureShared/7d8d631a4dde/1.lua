-- Threat: !InfrastructureShared
-- Name: 7d8d631a4dde
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Bundlore.CM")
  return mp.INFECTED
end
return mp.LOWFI
