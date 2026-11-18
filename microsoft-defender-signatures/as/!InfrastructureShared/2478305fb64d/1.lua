-- Threat: !InfrastructureShared
-- Name: 2478305fb64d
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
