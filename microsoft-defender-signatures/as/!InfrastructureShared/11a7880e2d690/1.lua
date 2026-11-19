-- Threat: !InfrastructureShared
-- Name: 11a7880e2d690
-- Type: 21

if mp.get_mpattribute("HSTR:Worm:MSIL/Cribz!modules") then
  return mp.INFECTED
end
return mp.LOWFI
