-- Threat: !InfrastructureShared
-- Name: 13d78c6bbfc99
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
