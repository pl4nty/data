-- Threat: !InfrastructureShared
-- Name: bf785a3890a9
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 404998 then
  return mp.INFECTED
end
return mp.CLEAN
