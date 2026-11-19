-- Threat: !InfrastructureShared
-- Name: 5f78d51d256e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
