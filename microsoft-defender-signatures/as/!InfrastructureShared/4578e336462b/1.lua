-- Threat: !InfrastructureShared
-- Name: 4578e336462b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
