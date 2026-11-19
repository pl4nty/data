-- Threat: !InfrastructureShared
-- Name: 78781b5f1d63
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
