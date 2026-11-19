-- Threat: !InfrastructureShared
-- Name: 618d2edb7b43
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundloreb.E")
  return mp.INFECTED
end
return mp.LOWFI
