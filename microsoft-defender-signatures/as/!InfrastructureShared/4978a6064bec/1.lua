-- Threat: !InfrastructureShared
-- Name: 4978a6064bec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
