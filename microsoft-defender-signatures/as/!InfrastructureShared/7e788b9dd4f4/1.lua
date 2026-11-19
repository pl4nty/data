-- Threat: !InfrastructureShared
-- Name: 7e788b9dd4f4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() == 42496 then
  return mp.INFECTED
end
return mp.CLEAN
