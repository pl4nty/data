-- Threat: !InfrastructureShared
-- Name: 4f782f2ded95
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
