-- Threat: !InfrastructureShared
-- Name: d54071b7e7fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
