-- Threat: !InfrastructureShared
-- Name: 326194e2c808
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
