-- Threat: !InfrastructureShared
-- Name: 39784506967d
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
