-- Threat: !InfrastructureShared
-- Name: 75782cd97c10
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 6200 then
  return mp.INFECTED
end
return mp.CLEAN
