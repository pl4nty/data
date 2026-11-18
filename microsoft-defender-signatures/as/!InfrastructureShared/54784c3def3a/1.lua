-- Threat: !InfrastructureShared
-- Name: 54784c3def3a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
