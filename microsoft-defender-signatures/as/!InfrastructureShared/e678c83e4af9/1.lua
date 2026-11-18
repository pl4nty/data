-- Threat: !InfrastructureShared
-- Name: e678c83e4af9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
