-- Threat: !InfrastructureShared
-- Name: 797846809eac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
