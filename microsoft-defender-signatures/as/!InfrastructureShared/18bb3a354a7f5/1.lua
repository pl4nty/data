-- Threat: !InfrastructureShared
-- Name: 18bb3a354a7f5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[7].matched or this_sigattrlog[7].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
local l_0_1 = bm.get_imagepath()
if not isnull(l_0_1) and string.len(l_0_1) > 4 then
  local l_0_2 = string.lower(l_0_1:match("\\([^\\]+)$") or "")
  local l_0_3 = {
    ["services.exe"] = true,
    ["svchost.exe"] = true,
    ["trustedinstaller.exe"] = true,
    ["tiworker.exe"] = true,
    ["poqexec.exe"] = true,
    ["msmpeng.exe"] = true,
    ["msiexec.exe"] = true,
    ["setuphost.exe"] = true,
    ["osrssinst.exe"] = true,
    ["printisolationhost.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
local l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if not isnull(l_0_4) then
  l_0_0 = string.lower(l_0_4)
end
local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_6
if not isnull(l_0_5) then
  l_0_6 = l_0_5[1]
else
  l_0_6 = l_0_0
end
local l_0_7 = {
  "\\spool\\drivers\\",
  "\\printconfig.dll",
  "\\hpzipm12.dll",
  "\\windows\\system32\\spool\\"
}
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if string.find(l_0_6, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_6, true, false) then
  return mp.CLEAN
end
local l_0_10 = this_sigattrlog[7].utf8p1
if not isnull(l_0_10) then
  local l_0_11 = string.match(string.lower(l_0_10), "\\services\\([^\\]+)")
  if l_0_11 then
    bm.add_related_string("HijackedService", l_0_11, bm.RelatedStringBMReport)
  end
end
if sysio.IsFileExists(l_0_6) then
  bm.add_related_file(l_0_6)
  bm.add_threat_file(l_0_6)
end
TrackFileAndTechnique(l_0_6, "T1543.003:svc_dll_hijack", 1000)
TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack")
return mp.INFECTED
