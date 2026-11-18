-- Threat: !InfrastructureShared
-- Name: 3c78b681aea5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
