-- Threat: !InfrastructureShared
-- Name: 4278ca90c0ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
