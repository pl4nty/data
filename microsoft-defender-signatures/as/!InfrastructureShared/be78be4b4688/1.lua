-- Threat: !InfrastructureShared
-- Name: be78be4b4688
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
