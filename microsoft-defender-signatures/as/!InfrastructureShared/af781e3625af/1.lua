-- Threat: !InfrastructureShared
-- Name: af781e3625af
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
