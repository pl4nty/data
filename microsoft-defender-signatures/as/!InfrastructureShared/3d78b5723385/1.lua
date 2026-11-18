-- Threat: !InfrastructureShared
-- Name: 3d78b5723385
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
