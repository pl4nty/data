-- Threat: !InfrastructureShared
-- Name: 13c78e742b035
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
