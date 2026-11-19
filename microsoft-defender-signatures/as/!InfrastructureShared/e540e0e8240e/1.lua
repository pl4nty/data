-- Threat: !InfrastructureShared
-- Name: e540e0e8240e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
