-- Threat: !InfrastructureShared
-- Name: 8d8de9b17e67
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacBooster.L")
  return mp.INFECTED
end
return mp.LOWFI
