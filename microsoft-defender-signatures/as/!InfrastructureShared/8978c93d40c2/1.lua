-- Threat: !InfrastructureShared
-- Name: 8978c93d40c2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
