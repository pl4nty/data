-- Threat: !InfrastructureShared
-- Name: a38d9bcaccec
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Cimpli.C")
  return mp.INFECTED
end
return mp.LOWFI
