-- Threat: !InfrastructureShared
-- Name: 12b788ec09796
-- Type: 21

if peattributes.isexe and peattributes.hasexports and peattributes.no_security and mp.getfilesize() >= 65535 and mp.getfilesize() <= 1048575 then
  return mp.INFECTED
end
return mp.CLEAN
