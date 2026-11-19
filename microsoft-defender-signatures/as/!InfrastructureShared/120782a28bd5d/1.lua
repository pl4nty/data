-- Threat: !InfrastructureShared
-- Name: 120782a28bd5d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
