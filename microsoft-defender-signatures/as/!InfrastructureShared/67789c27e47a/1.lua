-- Threat: !InfrastructureShared
-- Name: 67789c27e47a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
