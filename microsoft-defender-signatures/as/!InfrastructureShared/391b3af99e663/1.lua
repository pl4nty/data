-- Threat: !InfrastructureShared
-- Name: 391b3af99e663
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if not this_sigattrlog[13] or isnull(this_sigattrlog[13].utf8p1) then
  return mp.CLEAN
end
local l_0_0 = {
  ["4fc75186-2d08-4463-8273-286762239d76"] = true,
  ["d96c3b4f-2fab-47bc-b290-b77181ab7096"] = true,
  ["e19b7e59-ec56-4f6f-abe9-4b33f7ee7c69"] = true
}
local l_0_1 = versioning.GetOrgID()
if isnull(l_0_1) or not l_0_0[string.lower(l_0_1)] then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) or not mp.IsKnownFriendlyFile(l_0_2, true, false) then
  return mp.CLEAN
end
local l_0_3 = safeJsonSerialize({
  Process = l_0_2,
  DLL = this_sigattrlog[13].utf8p1
})
bm.add_related_file(this_sigattrlog[13].utf8p1)
bm.add_related_string("PotentialSideload_Metadata", l_0_3, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_3)
return mp.INFECTED
