-- Threat: !InfrastructureShared
-- Name: 647800c58255
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
