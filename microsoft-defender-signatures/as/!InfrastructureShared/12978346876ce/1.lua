-- Threat: !InfrastructureShared
-- Name: 12978346876ce
-- Type: 21

if hstrlog[6].hitcount >= 8 and peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 1048576 and mp.getfilesize() < 4194304 then
  return mp.INFECTED
end
return mp.CLEAN
