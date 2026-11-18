-- Threat: !InfrastructureShared
-- Name: 667891fe2d38
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
