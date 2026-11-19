-- Threat: !InfrastructureShared
-- Name: 3a78e8fce819
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
