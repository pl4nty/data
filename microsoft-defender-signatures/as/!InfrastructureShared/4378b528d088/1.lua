-- Threat: !InfrastructureShared
-- Name: 4378b528d088
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
