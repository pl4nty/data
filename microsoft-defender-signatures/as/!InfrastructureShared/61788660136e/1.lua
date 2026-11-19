-- Threat: !InfrastructureShared
-- Name: 61788660136e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and pesecs[2].Name == ".managed" and pesecs[2].Characteristics == 1610612768 then
  return mp.INFECTED
end
return mp.CLEAN
