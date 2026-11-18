-- Threat: !InfrastructureShared
-- Name: 60782c17404e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
