-- Threat: !InfrastructureShared
-- Name: e38d0ec3e44f
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Imobie.BA")
  return mp.INFECTED
end
return mp.LOWFI
