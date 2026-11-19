-- Threat: !InfrastructureShared
-- Name: 7a78687d227e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
