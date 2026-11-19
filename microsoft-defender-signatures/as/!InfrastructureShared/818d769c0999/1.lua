-- Threat: !InfrastructureShared
-- Name: 818d769c0999
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:WebShoppers.A")
  return mp.INFECTED
end
return mp.LOWFI
