-- Threat: !InfrastructureShared
-- Name: 9d788d6e783e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
