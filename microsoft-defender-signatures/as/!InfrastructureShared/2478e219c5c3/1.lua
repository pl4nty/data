-- Threat: !InfrastructureShared
-- Name: 2478e219c5c3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
