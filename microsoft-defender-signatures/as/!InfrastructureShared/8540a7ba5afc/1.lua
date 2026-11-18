-- Threat: !InfrastructureShared
-- Name: 8540a7ba5afc
-- Type: 21

if mp.getfilename():match("(Ole Stream 0).*%.scr") and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
