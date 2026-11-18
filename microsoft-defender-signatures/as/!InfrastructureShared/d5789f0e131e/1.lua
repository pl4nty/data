-- Threat: !InfrastructureShared
-- Name: d5789f0e131e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
