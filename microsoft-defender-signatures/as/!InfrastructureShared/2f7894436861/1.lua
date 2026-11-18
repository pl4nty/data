-- Threat: !InfrastructureShared
-- Name: 2f7894436861
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
