-- Threat: !InfrastructureShared
-- Name: 667845a93564
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
