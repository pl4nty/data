-- Threat: !InfrastructureShared
-- Name: 4878cc1d632a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
