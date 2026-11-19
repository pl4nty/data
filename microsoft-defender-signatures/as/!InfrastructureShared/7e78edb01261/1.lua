-- Threat: !InfrastructureShared
-- Name: 7e78edb01261
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
