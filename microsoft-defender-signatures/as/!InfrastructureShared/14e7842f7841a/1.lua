-- Threat: !InfrastructureShared
-- Name: 14e7842f7841a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
