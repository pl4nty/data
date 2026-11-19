-- Threat: !InfrastructureShared
-- Name: 4d78e2a300fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
