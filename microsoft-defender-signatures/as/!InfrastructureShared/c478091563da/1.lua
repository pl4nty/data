-- Threat: !InfrastructureShared
-- Name: c478091563da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
