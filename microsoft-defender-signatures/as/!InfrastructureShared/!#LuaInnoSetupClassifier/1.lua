-- Threat: !InfrastructureShared
-- Name: !#//Lua:InnoSetupClassifier
-- Type: 10
-- MpAttributes: //InnoSetup_Installer

if not peattributes.isexe then
  return mp.CLEAN
end
return mp.INFECTED
