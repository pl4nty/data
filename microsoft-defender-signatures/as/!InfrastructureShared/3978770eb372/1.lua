-- Threat: !InfrastructureShared
-- Name: 3978770eb372
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
