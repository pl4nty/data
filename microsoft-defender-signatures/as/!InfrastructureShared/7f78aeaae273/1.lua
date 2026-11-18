-- Threat: !InfrastructureShared
-- Name: 7f78aeaae273
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
