-- Threat: !InfrastructureShared
-- Name: 438d4de0df1c
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundloreb.D")
  return mp.INFECTED
end
return mp.LOWFI
