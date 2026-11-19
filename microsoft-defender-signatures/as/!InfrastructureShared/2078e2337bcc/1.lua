-- Threat: !InfrastructureShared
-- Name: 2078e2337bcc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
