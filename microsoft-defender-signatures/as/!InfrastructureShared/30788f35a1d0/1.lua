-- Threat: !InfrastructureShared
-- Name: 30788f35a1d0
-- Type: 21

if peattributes.is_process or not peattributes.isdll then
  return mp.CLEAN
end
return mp.INFECTED
