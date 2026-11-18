-- Threat: !InfrastructureShared
-- Name: 1017874a76417
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 80000 and mp.getfilesize() <= 90000 then
  return mp.INFECTED
end
return mp.CLEAN
