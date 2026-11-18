-- Threat: !InfrastructureShared
-- Name: 7d78272fd98e
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 340000 and mp.getfilesize() < 380000 then
  return mp.INFECTED
end
return mp.CLEAN
