-- Threat: !InfrastructureShared
-- Name: 51785a89ec47
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
