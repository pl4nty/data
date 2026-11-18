-- Threat: !InfrastructureShared
-- Name: c6be7535132d
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Mobby.T")
  return mp.INFECTED
end
return mp.LOWFI
