-- Threat: !InfrastructureShared
-- Name: 337819b5cd49
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
