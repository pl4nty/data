-- Threat: !InfrastructureShared
-- Name: 4b784c20a08e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
