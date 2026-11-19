-- Threat: !InfrastructureShared
-- Name: 3b78d461a8f8
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
