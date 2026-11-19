-- Threat: !InfrastructureShared
-- Name: a378d303b4cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
