-- Threat: !InfrastructureShared
-- Name: a4786684f608
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
