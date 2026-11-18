-- Threat: !InfrastructureShared
-- Name: d3be4dd1fd76
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  mp.set_mpattribute("PUA:Block:SheriDroid.B")
  return mp.INFECTED
end
return mp.LOWFI
