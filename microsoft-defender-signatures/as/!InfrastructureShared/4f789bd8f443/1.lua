-- Threat: !InfrastructureShared
-- Name: 4f789bd8f443
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
