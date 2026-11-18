-- Threat: !InfrastructureShared
-- Name: c778ca038f5f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
