-- Threat: !InfrastructureShared
-- Name: c540b73b7dac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
