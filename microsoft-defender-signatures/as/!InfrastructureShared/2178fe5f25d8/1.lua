-- Threat: !InfrastructureShared
-- Name: 2178fe5f25d8
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 15000 then
  return mp.INFECTED
end
return mp.CLEAN
