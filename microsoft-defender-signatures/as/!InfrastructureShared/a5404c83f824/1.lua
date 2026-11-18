-- Threat: !InfrastructureShared
-- Name: a5404c83f824
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
