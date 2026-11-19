-- Threat: !InfrastructureShared
-- Name: ed781a21b19c
-- Type: 21

if peattributes.ismsil then
  mp.set_mpattribute("HSTR:Worm:MSIL/Cribz!modules")
  return mp.INFECTED
end
return mp.CLEAN
