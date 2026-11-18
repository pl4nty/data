-- Threat: !InfrastructureShared
-- Name: cc8d449c4772
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:VSearch.D")
  return mp.INFECTED
end
return mp.LOWFI
