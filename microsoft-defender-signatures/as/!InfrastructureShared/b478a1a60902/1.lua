-- Threat: !InfrastructureShared
-- Name: b478a1a60902
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
