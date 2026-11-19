-- Threat: !InfrastructureShared
-- Name: 39788f3493b8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
