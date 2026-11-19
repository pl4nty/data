-- Threat: !InfrastructureShared
-- Name: ed78253f2fbd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
