-- Threat: !InfrastructureShared
-- Name: 668d431153ea
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Imobie.BB")
  return mp.INFECTED
end
return mp.LOWFI
