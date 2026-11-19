-- Threat: !InfrastructureShared
-- Name: 3678bd3aa486
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
