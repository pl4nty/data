-- Threat: !InfrastructureShared
-- Name: 8a78ead3d03f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
