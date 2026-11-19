-- Threat: !InfrastructureShared
-- Name: 4e780f789149
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
