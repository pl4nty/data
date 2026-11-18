-- Threat: !InfrastructureShared
-- Name: 4778472e51aa
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
