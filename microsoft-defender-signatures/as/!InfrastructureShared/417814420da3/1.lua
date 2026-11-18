-- Threat: !InfrastructureShared
-- Name: 417814420da3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
