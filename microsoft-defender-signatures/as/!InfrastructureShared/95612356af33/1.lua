-- Threat: !InfrastructureShared
-- Name: 95612356af33
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
