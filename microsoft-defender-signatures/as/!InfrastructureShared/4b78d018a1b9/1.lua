-- Threat: !InfrastructureShared
-- Name: 4b78d018a1b9
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 150000 and mp.getfilesize() < 170000 then
  return mp.INFECTED
end
return mp.CLEAN
