-- Threat: !InfrastructureShared
-- Name: 5e8da516327b
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.N")
  return mp.INFECTED
end
return mp.LOWFI
