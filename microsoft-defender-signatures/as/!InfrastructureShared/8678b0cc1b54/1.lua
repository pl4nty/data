-- Threat: !InfrastructureShared
-- Name: 8678b0cc1b54
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
