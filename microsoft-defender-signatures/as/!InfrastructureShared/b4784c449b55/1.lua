-- Threat: !InfrastructureShared
-- Name: b4784c449b55
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
