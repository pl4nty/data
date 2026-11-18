-- Threat: !InfrastructureShared
-- Name: a67862948215
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
