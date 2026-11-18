-- Threat: !InfrastructureShared
-- Name: 7b784c444151
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
