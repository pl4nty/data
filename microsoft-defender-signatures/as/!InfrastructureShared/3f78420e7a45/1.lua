-- Threat: !InfrastructureShared
-- Name: 3f78420e7a45
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
