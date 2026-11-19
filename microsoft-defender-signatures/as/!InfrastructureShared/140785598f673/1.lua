-- Threat: !InfrastructureShared
-- Name: 140785598f673
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
