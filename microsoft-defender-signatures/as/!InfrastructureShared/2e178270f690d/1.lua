-- Threat: !InfrastructureShared
-- Name: 2e178270f690d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
