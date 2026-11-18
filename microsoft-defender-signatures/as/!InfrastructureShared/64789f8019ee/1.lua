-- Threat: !InfrastructureShared
-- Name: 64789f8019ee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
