-- Threat: !InfrastructureShared
-- Name: ea782b96e373
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
