-- Threat: !InfrastructureShared
-- Name: ee7837f7a07d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
