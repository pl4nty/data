-- Threat: !InfrastructureShared
-- Name: 63789cf86e57
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
