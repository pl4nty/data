-- Threat: !InfrastructureShared
-- Name: 897894c78c44
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
