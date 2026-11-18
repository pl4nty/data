-- Threat: !InfrastructureShared
-- Name: 37785b066cc4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
