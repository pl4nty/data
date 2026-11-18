-- Threat: !InfrastructureShared
-- Name: 6178daa5b2e6
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
