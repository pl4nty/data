-- Threat: !InfrastructureShared
-- Name: 8178b10af4cd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
