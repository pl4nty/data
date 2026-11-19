-- Threat: !InfrastructureShared
-- Name: 3278e5e57d81
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
