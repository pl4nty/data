-- Threat: !InfrastructureShared
-- Name: 53787584a21e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
