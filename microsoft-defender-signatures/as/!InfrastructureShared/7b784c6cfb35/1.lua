-- Threat: !InfrastructureShared
-- Name: 7b784c6cfb35
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
