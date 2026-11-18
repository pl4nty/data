-- Threat: !InfrastructureShared
-- Name: b88d0fcca5ee
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.C")
  return mp.INFECTED
end
return mp.LOWFI
