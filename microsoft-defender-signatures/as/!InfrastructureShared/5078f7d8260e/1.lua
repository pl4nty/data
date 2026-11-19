-- Threat: !InfrastructureShared
-- Name: 5078f7d8260e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
