-- Threat: !InfrastructureShared
-- Name: 21788bd4a5b1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
