-- Threat: !InfrastructureShared
-- Name: bbbe572dad62
-- Type: 21

if mp.HSTR_WEIGHT >= 9 then
  mp.set_mpattribute("PUA:Block:Umpay.B")
  return mp.INFECTED
end
return mp.LOWFI
