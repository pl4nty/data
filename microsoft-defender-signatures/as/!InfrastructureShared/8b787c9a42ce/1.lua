-- Threat: !InfrastructureShared
-- Name: 8b787c9a42ce
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
