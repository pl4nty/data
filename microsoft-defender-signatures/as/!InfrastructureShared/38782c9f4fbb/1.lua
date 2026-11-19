-- Threat: !InfrastructureShared
-- Name: 38782c9f4fbb
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
