-- Threat: !InfrastructureShared
-- Name: 3e78afa4cafb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
