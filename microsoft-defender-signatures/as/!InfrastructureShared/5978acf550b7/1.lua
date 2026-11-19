-- Threat: !InfrastructureShared
-- Name: 5978acf550b7
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
