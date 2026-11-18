-- Threat: !InfrastructureShared
-- Name: e07821aa903c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
