-- Threat: !InfrastructureShared
-- Name: 2f78d7c77dde
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
