-- Threat: !InfrastructureShared
-- Name: 1c5401149ce26
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
