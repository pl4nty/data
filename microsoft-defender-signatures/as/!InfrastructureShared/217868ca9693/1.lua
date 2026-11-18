-- Threat: !InfrastructureShared
-- Name: 217868ca9693
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
