-- Threat: !InfrastructureShared
-- Name: 9378436355a4
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
