-- Threat: !InfrastructureShared
-- Name: f178eb0f9080
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2020000 then
  return mp.INFECTED
end
return mp.CLEAN
