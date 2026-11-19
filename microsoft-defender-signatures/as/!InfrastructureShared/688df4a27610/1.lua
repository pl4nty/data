-- Threat: !InfrastructureShared
-- Name: 688df4a27610
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:KSRecorder.A")
  return mp.INFECTED
end
return mp.LOWFI
