-- Threat: !InfrastructureShared
-- Name: 2d7834cfefc5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
