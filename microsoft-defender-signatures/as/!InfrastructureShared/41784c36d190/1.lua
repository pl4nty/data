-- Threat: !InfrastructureShared
-- Name: 41784c36d190
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
