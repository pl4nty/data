-- Threat: !InfrastructureShared
-- Name: 237899004945
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
