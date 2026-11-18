-- Threat: !InfrastructureShared
-- Name: 9078f2736bc2
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
