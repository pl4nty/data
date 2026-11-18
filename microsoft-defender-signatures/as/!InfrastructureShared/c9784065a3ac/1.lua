-- Threat: !InfrastructureShared
-- Name: c9784065a3ac
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
