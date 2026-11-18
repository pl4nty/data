-- Threat: !InfrastructureShared
-- Name: 14c78a96f63c1
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 85000 and mp.getfilesize() < 88000 then
  return mp.INFECTED
end
return mp.CLEAN
