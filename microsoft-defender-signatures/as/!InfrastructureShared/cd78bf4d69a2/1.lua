-- Threat: !InfrastructureShared
-- Name: cd78bf4d69a2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
