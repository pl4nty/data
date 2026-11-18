-- Threat: !InfrastructureShared
-- Name: ef78085243e9
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 483842 then
  return mp.INFECTED
end
return mp.CLEAN
