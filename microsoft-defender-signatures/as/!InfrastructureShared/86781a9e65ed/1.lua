-- Threat: !InfrastructureShared
-- Name: 86781a9e65ed
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
