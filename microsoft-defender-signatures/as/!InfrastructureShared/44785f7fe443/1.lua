-- Threat: !InfrastructureShared
-- Name: 44785f7fe443
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
