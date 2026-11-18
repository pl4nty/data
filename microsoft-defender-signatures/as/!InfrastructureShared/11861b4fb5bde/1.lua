-- Threat: !InfrastructureShared
-- Name: 11861b4fb5bde
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
