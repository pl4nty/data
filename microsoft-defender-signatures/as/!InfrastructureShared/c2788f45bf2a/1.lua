-- Threat: !InfrastructureShared
-- Name: c2788f45bf2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
