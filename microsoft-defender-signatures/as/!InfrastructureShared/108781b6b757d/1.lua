-- Threat: !InfrastructureShared
-- Name: 108781b6b757d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
