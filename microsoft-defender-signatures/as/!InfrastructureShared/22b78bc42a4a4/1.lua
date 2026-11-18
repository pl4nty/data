-- Threat: !InfrastructureShared
-- Name: 22b78bc42a4a4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2117632 then
  return mp.INFECTED
end
return mp.CLEAN
