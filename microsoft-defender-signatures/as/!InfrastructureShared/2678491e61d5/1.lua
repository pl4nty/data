-- Threat: !InfrastructureShared
-- Name: 2678491e61d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
