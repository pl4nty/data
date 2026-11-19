-- Threat: !InfrastructureShared
-- Name: be7879bdf6fb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
