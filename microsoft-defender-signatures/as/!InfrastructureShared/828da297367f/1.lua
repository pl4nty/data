-- Threat: !InfrastructureShared
-- Name: 828da297367f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:VSearch.G")
  return mp.INFECTED
end
return mp.LOWFI
