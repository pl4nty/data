-- Threat: !InfrastructureShared
-- Name: 1778dc4ba77e2
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Yontoo.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
