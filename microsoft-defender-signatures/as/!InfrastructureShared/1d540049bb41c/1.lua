-- Threat: !InfrastructureShared
-- Name: 1d540049bb41c
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
