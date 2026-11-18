-- Threat: !InfrastructureShared
-- Name: 7178b04ed7e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
