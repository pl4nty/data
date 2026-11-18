-- Threat: !InfrastructureShared
-- Name: 8d78062226f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
