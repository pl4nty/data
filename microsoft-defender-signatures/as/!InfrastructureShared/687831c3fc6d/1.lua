-- Threat: !InfrastructureShared
-- Name: 687831c3fc6d
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
