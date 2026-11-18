-- Threat: !InfrastructureShared
-- Name: ea78ed4fcfff
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
