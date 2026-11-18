-- Threat: !InfrastructureShared
-- Name: 7d7861f47a36
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
