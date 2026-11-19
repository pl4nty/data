-- Threat: !InfrastructureShared
-- Name: 7878d2298c70
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
