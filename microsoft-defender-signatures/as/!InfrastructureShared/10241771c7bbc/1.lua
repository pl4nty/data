-- Threat: !InfrastructureShared
-- Name: 10241771c7bbc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
