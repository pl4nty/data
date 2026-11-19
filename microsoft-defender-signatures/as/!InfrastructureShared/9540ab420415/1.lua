-- Threat: !InfrastructureShared
-- Name: 9540ab420415
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
