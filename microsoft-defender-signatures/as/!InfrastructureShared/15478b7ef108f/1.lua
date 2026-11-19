-- Threat: !InfrastructureShared
-- Name: 15478b7ef108f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
