-- Threat: !InfrastructureShared
-- Name: 9540e2a7224e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
