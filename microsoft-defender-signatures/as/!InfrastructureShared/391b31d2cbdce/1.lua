-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\391b31d2cbdce\1.luac 

-- params : ...
-- function num : 0
if not this_sigattrlog[13] or isnull((this_sigattrlog[13]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = {}
l_0_0["4fc75186-2d08-4463-8273-286762239d76"] = true
l_0_0["d96c3b4f-2fab-47bc-b290-b77181ab7096"] = true
l_0_0["e19b7e59-ec56-4f6f-abe9-4b33f7ee7c69"] = true
local l_0_1 = (versioning.GetOrgID)()
if isnull(l_0_1) or not l_0_0[(string.lower)(l_0_1)] then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) or not (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
  return mp.CLEAN
end
local l_0_3 = safeJsonSerialize
local l_0_4 = {}
l_0_4.Process = l_0_2
l_0_4.DLL = (this_sigattrlog[13]).utf8p1
l_0_3 = l_0_3(l_0_4)
l_0_4 = bm
l_0_4 = l_0_4.add_related_file
l_0_4((this_sigattrlog[13]).utf8p1)
l_0_4 = bm
l_0_4 = l_0_4.add_related_string
l_0_4("PotentialSideload_Metadata", l_0_3, bm.RelatedStringBMReport)
l_0_4 = bm
l_0_4 = l_0_4.set_detection_string
l_0_4(l_0_3)
l_0_4 = mp
l_0_4 = l_0_4.INFECTED
return l_0_4

