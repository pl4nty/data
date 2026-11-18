-- Threat: !InfrastructureShared
-- Name: 8540a101adeb
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
