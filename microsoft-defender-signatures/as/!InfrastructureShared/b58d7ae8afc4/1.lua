-- Threat: !InfrastructureShared
-- Name: b58d7ae8afc4
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Searchproxy.D")
  return mp.INFECTED
end
return mp.LOWFI
