-- Threat: !InfrastructureShared
-- Name: 4078f40b0467
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
