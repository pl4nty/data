-- Threat: !InfrastructureShared
-- Name: b28d1d20653b
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AcidKeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
