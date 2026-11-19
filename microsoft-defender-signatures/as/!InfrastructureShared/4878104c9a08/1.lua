-- Threat: !InfrastructureShared
-- Name: 4878104c9a08
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
