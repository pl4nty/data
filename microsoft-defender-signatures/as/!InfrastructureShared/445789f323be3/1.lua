-- Threat: !InfrastructureShared
-- Name: 445789f323be3
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
