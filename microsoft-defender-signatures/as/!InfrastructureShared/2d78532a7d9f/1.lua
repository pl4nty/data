-- Threat: !InfrastructureShared
-- Name: 2d78532a7d9f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
