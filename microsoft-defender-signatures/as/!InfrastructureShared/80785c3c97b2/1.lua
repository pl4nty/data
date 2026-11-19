-- Threat: !InfrastructureShared
-- Name: 80785c3c97b2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
