-- Threat: !InfrastructureShared
-- Name: 9540c3def067
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
