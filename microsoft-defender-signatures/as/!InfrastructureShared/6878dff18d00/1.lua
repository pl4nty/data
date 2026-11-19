-- Threat: !InfrastructureShared
-- Name: 6878dff18d00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
