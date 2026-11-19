-- Threat: !InfrastructureShared
-- Name: 596164a5582e
-- Type: 21

if peattributes.is_delphi and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
