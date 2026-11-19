-- Threat: !InfrastructureShared
-- Name: 75786e088d51
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
