-- Threat: !InfrastructureShared
-- Name: ed7879e56c89
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
