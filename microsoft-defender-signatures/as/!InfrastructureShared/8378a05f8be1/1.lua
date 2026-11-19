-- Threat: !InfrastructureShared
-- Name: 8378a05f8be1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
