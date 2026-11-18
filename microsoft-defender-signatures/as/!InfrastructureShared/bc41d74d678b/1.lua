-- Threat: !InfrastructureShared
-- Name: bc41d74d678b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
