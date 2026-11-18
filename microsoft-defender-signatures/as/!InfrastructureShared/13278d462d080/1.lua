-- Threat: !InfrastructureShared
-- Name: 13278d462d080
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
