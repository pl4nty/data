-- Threat: !InfrastructureShared
-- Name: cd783406006e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
