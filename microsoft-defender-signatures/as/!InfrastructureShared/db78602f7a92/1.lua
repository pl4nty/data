-- Threat: !InfrastructureShared
-- Name: db78602f7a92
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
