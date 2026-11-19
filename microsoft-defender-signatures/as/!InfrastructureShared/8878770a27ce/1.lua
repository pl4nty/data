-- Threat: !InfrastructureShared
-- Name: 8878770a27ce
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 100000 then
  return mp.CLEAN
end
return mp.INFECTED
