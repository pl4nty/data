-- Threat: !InfrastructureShared
-- Name: d48dff8f9ebf
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  mp.set_mpattribute("PUA:Block:Glims.F")
  return mp.INFECTED
end
return mp.LOWFI
