-- Threat: !InfrastructureShared
-- Name: a978985e5a10
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
