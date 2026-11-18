-- Threat: !InfrastructureShared
-- Name: f97857c7ec38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
