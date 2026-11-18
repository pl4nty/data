-- Threat: !InfrastructureShared
-- Name: 154074b6b489
-- Type: 21

if peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
