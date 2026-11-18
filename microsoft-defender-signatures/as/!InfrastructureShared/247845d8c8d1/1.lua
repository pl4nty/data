-- Threat: !InfrastructureShared
-- Name: 247845d8c8d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
