-- Threat: !InfrastructureShared
-- Name: e678e39ae81e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
