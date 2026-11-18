-- Threat: !InfrastructureShared
-- Name: 7b783134a6ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
