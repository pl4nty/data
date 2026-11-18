-- Threat: !InfrastructureShared
-- Name: 8c7865705d21
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 78000 then
  return mp.INFECTED
end
return mp.CLEAN
