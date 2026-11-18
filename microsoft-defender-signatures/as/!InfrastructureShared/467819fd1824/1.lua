-- Threat: !InfrastructureShared
-- Name: 467819fd1824
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
