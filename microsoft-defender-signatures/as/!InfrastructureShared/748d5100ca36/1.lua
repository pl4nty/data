-- Threat: !InfrastructureShared
-- Name: 748d5100ca36
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Convuster.B")
  return mp.INFECTED
end
return mp.LOWFI
