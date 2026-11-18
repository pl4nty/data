-- Threat: !InfrastructureShared
-- Name: c28d746fcbae
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:PCVarkAPM.A")
  return mp.INFECTED
end
return mp.LOWFI
