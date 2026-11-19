-- Threat: !InfrastructureShared
-- Name: dc78d747229d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
