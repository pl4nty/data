-- Threat: !InfrastructureShared
-- Name: fe6161d42e3f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
