-- Threat: !InfrastructureShared
-- Name: 97786a12c108
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
