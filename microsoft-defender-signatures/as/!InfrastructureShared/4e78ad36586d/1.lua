-- Threat: !InfrastructureShared
-- Name: 4e78ad36586d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
