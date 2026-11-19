-- Threat: !InfrastructureShared
-- Name: 3f782e8fca80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
