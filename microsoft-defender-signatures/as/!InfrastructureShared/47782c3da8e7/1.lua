-- Threat: !InfrastructureShared
-- Name: 47782c3da8e7
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
