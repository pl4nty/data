-- Threat: !InfrastructureShared
-- Name: 8b78ff7cc728
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
