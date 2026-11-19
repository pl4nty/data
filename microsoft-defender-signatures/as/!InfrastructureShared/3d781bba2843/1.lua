-- Threat: !InfrastructureShared
-- Name: 3d781bba2843
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
