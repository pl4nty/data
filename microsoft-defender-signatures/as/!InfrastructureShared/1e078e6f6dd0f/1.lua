-- Threat: !InfrastructureShared
-- Name: 1e078e6f6dd0f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
