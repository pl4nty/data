-- Threat: !InfrastructureShared
-- Name: 49782dcf6bc5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
