-- Threat: !InfrastructureShared
-- Name: 125406eee32df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
