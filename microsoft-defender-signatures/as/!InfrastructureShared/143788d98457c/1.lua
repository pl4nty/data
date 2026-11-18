-- Threat: !InfrastructureShared
-- Name: 143788d98457c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
