-- Threat: !InfrastructureShared
-- Name: 5dbe3bf1f9aa
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Kuguo.B")
  return mp.INFECTED
end
return mp.LOWFI
