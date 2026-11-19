-- Threat: !InfrastructureShared
-- Name: 3f7879b66109
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
