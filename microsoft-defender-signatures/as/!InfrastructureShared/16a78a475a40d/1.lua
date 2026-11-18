-- Threat: !InfrastructureShared
-- Name: 16a78a475a40d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
