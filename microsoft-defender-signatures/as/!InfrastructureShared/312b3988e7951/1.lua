-- Threat: !InfrastructureShared
-- Name: 312b3988e7951
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "\\Microsoft Office\\root\\Office",
  "OneDrive\\OneDrive.exe$",
  "\\bin\\PBIDesktop.exe$",
  "\\MSS\\IRTKDeploy\\Fennec64.exe$",
  "\\program files.-agent.-.exe$",
  "\\windows\\system32\\MdmDiagnosticsTool.exe$",
  "\\MonAgentCore.exe$",
  "\\DNF\\DNF.exe$",
  "\\AutomationAnywhere.ManagedDLLWrapper.exe$",
  "\\GoogleDriveFS.exe$",
  "\\LINE\\bin\\current\\LINE.exe$",
  "\\LineCall.exe$",
  "\\Telegram Desktop\\Telegram.exe$",
  "\\WhatsApp.exe$"
}
local l_0_2 = l_0_0:lower()
for l_0_3, l_0_4 in pairs(l_0_1) do
  if string.find(l_0_2, l_0_4:lower(), 1, false) then
    return mp.CLEAN
  end
end
local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = checkFileLastWriteTime(l_0_0, 3600)
if l_0_5 == true then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
local l_0_10
if this_sigattrlog[16].matched then
  l_0_10 = parseNetworkVolumeEvent(this_sigattrlog[16])
end
if isnull(l_0_10) then
  return mp.CLEAN
end
if not isPublicIP(l_0_10.DestIp) then
  return mp.CLEAN
end
local l_0_11 = bm.GetOverallTrafficVolumes()
if isnull(l_0_11) then
  return mp.CLEAN
end
if tonumber(l_0_10.Bout) < 1048576 or l_0_11.outgoing_req < 10485760 or tonumber(l_0_10.Bin) > tonumber(l_0_10.Bout) or l_0_11.incoming_response > l_0_11.outgoing_req then
  return mp.CLEAN
end
local l_0_12
if this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
  l_0_12 = string.match(this_sigattrlog[18].utf8p1:lower(), "\\.+(%..+)$")
end
add_parents()
reportRelatedBmHits()
addOverallNetworkVolume()
bm.add_related_string("SuspiciosProcessAge", l_0_6, bm.RelatedStringBMReport)
bm.add_related_string("SensitiveFileExt", l_0_12, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
return mp.INFECTED
