-- Threat: !InfrastructureShared
-- Name: f5614290999e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
