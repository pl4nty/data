-- Threat: !InfrastructureShared
-- Name: c0788fd2cc6c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
