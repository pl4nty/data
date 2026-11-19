-- Threat: !InfrastructureShared
-- Name: 317821253111
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
