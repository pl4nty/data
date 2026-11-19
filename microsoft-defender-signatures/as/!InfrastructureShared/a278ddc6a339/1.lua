-- Threat: !InfrastructureShared
-- Name: a278ddc6a339
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
