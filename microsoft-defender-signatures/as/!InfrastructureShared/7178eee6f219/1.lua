-- Threat: !InfrastructureShared
-- Name: 7178eee6f219
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
