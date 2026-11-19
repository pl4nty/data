-- Threat: !InfrastructureShared
-- Name: 797801ed8350
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
