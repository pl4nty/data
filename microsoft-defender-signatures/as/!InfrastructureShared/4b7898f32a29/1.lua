-- Threat: !InfrastructureShared
-- Name: 4b7898f32a29
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
