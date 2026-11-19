-- Threat: !InfrastructureShared
-- Name: 367899430512
-- Type: 21

if peattributes.isexe and peattributes.no_exports and peattributes.suspicious_ntheader then
  return mp.INFECTED
end
return mp.CLEAN
