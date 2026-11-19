-- Threat: !InfrastructureShared
-- Name: 5f78c1ed8301
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
