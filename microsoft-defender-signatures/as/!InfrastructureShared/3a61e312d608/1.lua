-- Threat: !InfrastructureShared
-- Name: 3a61e312d608
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
