-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ContextualDropPossibleRansomExe.C!fdr
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
if not peattributes.isexe or peattributes.isdriver or peattributes.no_security == false or peattributes.no_fixups == false then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\public$") ~= nil or l_0_0:find("\\microsoft\\systemcertificates\\my\\certificates$") then
  return mp.INFECTED
end
return mp.CLEAN
