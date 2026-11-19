-- Threat: !InfrastructureShared
-- Name: 527899a0254d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
