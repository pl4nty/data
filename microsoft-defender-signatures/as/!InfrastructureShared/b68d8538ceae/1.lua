-- Threat: !InfrastructureShared
-- Name: b68d8538ceae
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacBooster.C")
  return mp.INFECTED
end
return mp.LOWFI
