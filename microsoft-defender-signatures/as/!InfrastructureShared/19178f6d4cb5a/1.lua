-- Threat: !InfrastructureShared
-- Name: 19178f6d4cb5a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
