-- Threat: !InfrastructureShared
-- Name: 7578ce8d0187
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
