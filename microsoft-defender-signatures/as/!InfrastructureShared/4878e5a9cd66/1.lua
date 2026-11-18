-- Threat: !InfrastructureShared
-- Name: 4878e5a9cd66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
