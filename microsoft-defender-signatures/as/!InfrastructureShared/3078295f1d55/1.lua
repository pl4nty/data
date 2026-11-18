-- Threat: !InfrastructureShared
-- Name: 3078295f1d55
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
