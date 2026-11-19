-- Threat: !InfrastructureShared
-- Name: 958d06ce189a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Crossrider.A")
  return mp.INFECTED
end
return mp.LOWFI
