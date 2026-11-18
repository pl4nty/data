-- Threat: !InfrastructureShared
-- Name: 7a78eaae0681
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
