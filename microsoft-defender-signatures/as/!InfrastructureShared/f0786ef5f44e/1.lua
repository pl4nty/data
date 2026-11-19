-- Threat: !InfrastructureShared
-- Name: f0786ef5f44e
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
