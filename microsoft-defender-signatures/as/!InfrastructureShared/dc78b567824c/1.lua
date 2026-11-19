-- Threat: !InfrastructureShared
-- Name: dc78b567824c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
