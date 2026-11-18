-- Threat: !InfrastructureShared
-- Name: 4878d06ea274
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
