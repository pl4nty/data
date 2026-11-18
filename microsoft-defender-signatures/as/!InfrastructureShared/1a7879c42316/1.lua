-- Threat: !InfrastructureShared
-- Name: 1a7879c42316
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
