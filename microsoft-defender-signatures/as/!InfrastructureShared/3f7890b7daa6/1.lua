-- Threat: !InfrastructureShared
-- Name: 3f7890b7daa6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
