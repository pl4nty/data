-- Threat: !InfrastructureShared
-- Name: c27815decc13
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
