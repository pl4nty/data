-- Threat: !InfrastructureShared
-- Name: 9c78e71fb755
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
