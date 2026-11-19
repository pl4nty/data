-- Threat: !InfrastructureShared
-- Name: 22612e7a5316
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
