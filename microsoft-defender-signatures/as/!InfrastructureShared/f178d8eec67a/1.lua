-- Threat: !InfrastructureShared
-- Name: f178d8eec67a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 8194 then
  return mp.INFECTED
end
return mp.CLEAN
