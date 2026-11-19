-- Threat: !InfrastructureShared
-- Name: 48781f677510
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
