-- Threat: !InfrastructureShared
-- Name: fe7883166756
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
