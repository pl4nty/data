-- Threat: !InfrastructureShared
-- Name: 41784a9c8d17
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
