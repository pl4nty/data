-- Threat: !InfrastructureShared
-- Name: 10578232aa784
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
