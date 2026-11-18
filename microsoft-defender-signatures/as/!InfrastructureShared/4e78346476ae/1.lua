-- Threat: !InfrastructureShared
-- Name: 4e78346476ae
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
