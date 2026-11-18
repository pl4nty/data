-- Threat: !InfrastructureShared
-- Name: 10578643a8b81
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
