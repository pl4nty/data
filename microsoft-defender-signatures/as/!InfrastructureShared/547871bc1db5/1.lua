-- Threat: !InfrastructureShared
-- Name: 547871bc1db5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
