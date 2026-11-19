-- Threat: !InfrastructureShared
-- Name: 5178f0f6c9df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
