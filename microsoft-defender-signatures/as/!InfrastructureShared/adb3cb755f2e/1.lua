-- Threat: !InfrastructureShared
-- Name: adb3cb755f2e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[4].utf8p2
else
  return mp.CLEAN
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = l_0_0
l_0_0 = string.lower(l_0_0)
local l_0_3 = ""
if not isnull(l_0_1) then
  l_0_3 = string.lower(l_0_1)
end
local l_0_4 = string.find(l_0_0, "com.microsoft.runedge", 1, true)
local l_0_5 = string.find(l_0_0, "com.microsoft.", 1, true)
local l_0_6 = string.find(l_0_3, "\\appdata\\", 1, true) or string.find(l_0_3, "\\temp\\", 1, true) or string.find(l_0_3, "\\programdata\\", 1, true) or string.find(l_0_3, "\\users\\public\\", 1, true)
if not l_0_4 and (not l_0_5 or not l_0_6) then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
bm.add_related_string("NMH_KEY", l_0_2, bm.RelatedStringBMReport)
if not isnull(l_0_1) then
  bm.add_related_string("NMH_MANIFEST", l_0_1, bm.RelatedStringBMReport)
  bm_AddRelatedFileFromCommandLine(string.lower(l_0_1), nil, nil, 1)
end
local l_0_7 = bm.get_imagepath()
if l_0_7 then
  bm.add_related_file(l_0_7)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1176.001", "AntinoNativeMessagingHost.AM")
return mp.INFECTED
