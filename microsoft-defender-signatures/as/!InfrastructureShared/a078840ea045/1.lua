-- Threat: !InfrastructureShared
-- Name: a078840ea045
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
