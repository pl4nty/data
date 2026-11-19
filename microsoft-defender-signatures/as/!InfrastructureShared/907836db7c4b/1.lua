-- Threat: !InfrastructureShared
-- Name: 907836db7c4b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
