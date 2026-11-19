-- Threat: !InfrastructureShared
-- Name: a078f10b6b38
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
