-- Threat: !InfrastructureShared
-- Name: 2078d0c34ced
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
