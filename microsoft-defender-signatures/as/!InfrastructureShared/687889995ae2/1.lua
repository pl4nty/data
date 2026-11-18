-- Threat: !InfrastructureShared
-- Name: 687889995ae2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
