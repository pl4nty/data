-- Threat: !InfrastructureShared
-- Name: 10978328439db
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
