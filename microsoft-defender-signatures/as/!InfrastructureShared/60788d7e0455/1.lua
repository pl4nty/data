-- Threat: !InfrastructureShared
-- Name: 60788d7e0455
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
