-- Threat: !InfrastructureShared
-- Name: !#SLF:RelevantUnknowns
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Nscript:Type_js | Nscript:Type_vbs | BM_MZ_FILE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= nil and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
if mp.GetResmgrBasePlugin() ~= "Folder" then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if l_0_1:find(":\\windows\\winsxs", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_1:find(":\\windows\\installer", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_1:find(":\\sccmcontentlib\\filelib", 1, true) ~= nil then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == false then
  return mp.INFECTED
end
return mp.CLEAN
