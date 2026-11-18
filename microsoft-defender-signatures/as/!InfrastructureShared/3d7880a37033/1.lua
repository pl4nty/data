-- Threat: !InfrastructureShared
-- Name: 3d7880a37033
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
