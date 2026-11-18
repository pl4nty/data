-- Threat: !InfrastructureShared
-- Name: 828d74a78e5d
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Spc.A")
  return mp.INFECTED
end
return mp.LOWFI
