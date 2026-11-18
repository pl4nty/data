-- Threat: !InfrastructureShared
-- Name: cc78824f2e7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
