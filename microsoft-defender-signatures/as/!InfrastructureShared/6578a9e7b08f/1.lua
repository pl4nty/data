-- Threat: !InfrastructureShared
-- Name: 6578a9e7b08f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
