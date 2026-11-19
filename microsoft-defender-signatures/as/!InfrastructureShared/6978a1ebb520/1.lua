-- Threat: !InfrastructureShared
-- Name: 6978a1ebb520
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
