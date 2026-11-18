-- Threat: !InfrastructureShared
-- Name: !#BLKACC:3b576869-a4ec-4529-8536-b80a7769e899
-- Type: 11
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile

if not mp.IsHipsRuleEnabled("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not peattributes.isexe and not peattributes.isdll and not peattributes.isdriver then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_0, "enghipscpy:blockaccess:3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if mp.IsPathExcludedForHipsRule(l_0_0, "3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables("%userprofile%"))
local l_0_2
if l_0_1 ~= nil and l_0_1 ~= "" then
  l_0_2 = string.match(l_0_1, "(%a:.*\\)[^\\]+$")
end
if l_0_2 ~= nil and l_0_2 ~= "" and l_0_0:find(l_0_2 .. "[^\\]+\\appdata\\local\\apps\\2.0\\.+\\dealanalysistool.dll") ~= nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = mp.IsTrustedFile(false)
if l_0_3 == true then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
