-- Threat: !InfrastructureShared
-- Name: ab784ead0f79
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
