-- Threat: !InfrastructureShared
-- Name: 5e781c41dbf5
-- Type: 21

if hstrlog[3].hitcount >= 5 and peattributes.isexe == true and peattributes.no_security == false and mp.getfilesize() > 1048576 and mp.getfilesize() < 2097152 and pehdr.TimeDateStamp == 3430198102 then
  return mp.INFECTED
end
return mp.CLEAN
