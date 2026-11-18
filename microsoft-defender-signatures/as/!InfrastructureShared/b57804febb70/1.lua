-- Threat: !InfrastructureShared
-- Name: b57804febb70
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
