-- Threat: !InfrastructureShared
-- Name: 748d2a540f7c
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Searchproxy.A")
  return mp.INFECTED
end
return mp.LOWFI
