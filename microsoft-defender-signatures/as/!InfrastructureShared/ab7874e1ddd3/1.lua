-- Threat: !InfrastructureShared
-- Name: ab7874e1ddd3
-- Type: 21

if mp.HSTR_WEIGHT > 15 then
  mp.set_mpattribute("ALFPER:Rakzmer.A2X")
end
mp.set_mpattribute("PUA:Block:Rakzmer")
return mp.INFECTED
