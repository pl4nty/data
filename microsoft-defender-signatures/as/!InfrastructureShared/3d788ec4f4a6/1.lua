-- Threat: !InfrastructureShared
-- Name: 3d788ec4f4a6
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
