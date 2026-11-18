-- Threat: !InfrastructureShared
-- Name: 627808c8d364
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
