-- Threat: !InfrastructureShared
-- Name: 5278263d0d87
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
