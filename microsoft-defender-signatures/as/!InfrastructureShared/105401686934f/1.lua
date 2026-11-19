-- Threat: !InfrastructureShared
-- Name: 105401686934f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
