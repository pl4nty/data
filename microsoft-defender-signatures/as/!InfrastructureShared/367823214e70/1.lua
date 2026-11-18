-- Threat: !InfrastructureShared
-- Name: 367823214e70
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 1048576 and mp.getfilesize() < 4194304 then
  return mp.INFECTED
end
return mp.CLEAN
