-- Threat: !InfrastructureShared
-- Name: 10978832eabb7
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
