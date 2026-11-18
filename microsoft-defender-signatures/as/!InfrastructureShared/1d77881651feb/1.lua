-- Threat: !InfrastructureShared
-- Name: 1d77881651feb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
