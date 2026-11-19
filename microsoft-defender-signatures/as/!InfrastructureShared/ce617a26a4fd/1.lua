-- Threat: !InfrastructureShared
-- Name: ce617a26a4fd
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
