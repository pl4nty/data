-- Threat: !InfrastructureShared
-- Name: da78b260217d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
