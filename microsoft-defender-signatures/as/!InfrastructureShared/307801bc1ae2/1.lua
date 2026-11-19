-- Threat: !InfrastructureShared
-- Name: 307801bc1ae2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
