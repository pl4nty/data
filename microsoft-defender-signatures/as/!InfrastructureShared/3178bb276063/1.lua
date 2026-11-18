-- Threat: !InfrastructureShared
-- Name: 3178bb276063
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
