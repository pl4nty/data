-- Threat: !InfrastructureShared
-- Name: 4c78e315aaf2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
