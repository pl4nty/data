-- Threat: !InfrastructureShared
-- Name: 8378a06f4566
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
