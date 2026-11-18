-- Threat: !InfrastructureShared
-- Name: 70788df49b96
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
