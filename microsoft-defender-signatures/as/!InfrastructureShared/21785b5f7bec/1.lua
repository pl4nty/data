-- Threat: !InfrastructureShared
-- Name: 21785b5f7bec
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
