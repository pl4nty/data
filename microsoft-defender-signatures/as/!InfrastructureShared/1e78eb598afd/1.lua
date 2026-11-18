-- Threat: !InfrastructureShared
-- Name: 1e78eb598afd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
