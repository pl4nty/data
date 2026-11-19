-- Threat: !InfrastructureShared
-- Name: 637838b80b5a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
