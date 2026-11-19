-- Threat: !InfrastructureShared
-- Name: 11f783bd91101
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
