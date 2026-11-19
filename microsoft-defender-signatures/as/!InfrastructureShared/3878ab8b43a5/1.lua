-- Threat: !InfrastructureShared
-- Name: 3878ab8b43a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
