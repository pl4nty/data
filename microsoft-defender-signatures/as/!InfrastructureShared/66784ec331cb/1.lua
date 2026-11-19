-- Threat: !InfrastructureShared
-- Name: 66784ec331cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
