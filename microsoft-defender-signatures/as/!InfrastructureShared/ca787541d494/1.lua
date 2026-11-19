-- Threat: !InfrastructureShared
-- Name: ca787541d494
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
