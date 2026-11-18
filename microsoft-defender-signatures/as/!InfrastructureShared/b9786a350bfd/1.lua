-- Threat: !InfrastructureShared
-- Name: b9786a350bfd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
