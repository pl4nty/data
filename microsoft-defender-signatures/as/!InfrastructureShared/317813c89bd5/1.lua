-- Threat: !InfrastructureShared
-- Name: 317813c89bd5
-- Type: 21

if peattributes.isexe == true and pesecs[11].Name == ".GSM_UTF" then
  return mp.INFECTED
end
return mp.CLEAN
