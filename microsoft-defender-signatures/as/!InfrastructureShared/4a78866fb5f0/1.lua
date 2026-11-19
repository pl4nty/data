-- Threat: !InfrastructureShared
-- Name: 4a78866fb5f0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and pesecs[5].Name == ".gxfg" then
  return mp.INFECTED
end
return mp.CLEAN
