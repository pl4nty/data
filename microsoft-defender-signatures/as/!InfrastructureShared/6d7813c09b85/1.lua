-- Threat: !InfrastructureShared
-- Name: 6d7813c09b85
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
