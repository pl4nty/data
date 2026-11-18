-- Threat: !InfrastructureShared
-- Name: f27870067089
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
