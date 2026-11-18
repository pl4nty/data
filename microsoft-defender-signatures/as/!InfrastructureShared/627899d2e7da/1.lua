-- Threat: !InfrastructureShared
-- Name: 627899d2e7da
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
