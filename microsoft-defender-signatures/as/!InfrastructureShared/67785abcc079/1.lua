-- Threat: !InfrastructureShared
-- Name: 67785abcc079
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
