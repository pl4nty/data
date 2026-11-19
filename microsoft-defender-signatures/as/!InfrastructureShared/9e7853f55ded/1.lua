-- Threat: !InfrastructureShared
-- Name: 9e7853f55ded
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
