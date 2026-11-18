-- Threat: !InfrastructureShared
-- Name: a2788c7cbd0f
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
