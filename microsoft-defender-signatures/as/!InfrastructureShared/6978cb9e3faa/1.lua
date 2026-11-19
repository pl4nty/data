-- Threat: !InfrastructureShared
-- Name: 6978cb9e3faa
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
