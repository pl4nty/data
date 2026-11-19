-- Threat: !InfrastructureShared
-- Name: 1554065ccc67f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
