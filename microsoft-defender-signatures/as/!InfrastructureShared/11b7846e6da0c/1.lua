-- Threat: !InfrastructureShared
-- Name: 11b7846e6da0c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.hasexports == false and mp.getfilesize() < 24117248 then
  return mp.INFECTED
end
return mp.CLEAN
