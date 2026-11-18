-- Threat: !InfrastructureShared
-- Name: 220b30275fa2f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p2 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_1 = string.find(l_0_0, "/format:", 1, true) or string.find(l_0_0, "/format :", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = {
  "/format:csv",
  "/format:list",
  "/format:table",
  "/format:value",
  "/format:rawxml",
  "/format:htable",
  "/format:hform",
  "/format:textvaluelist"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_5, 1, true) then
    return mp.CLEAN
  end
end
bm.add_related_string("xsl_wmic_cmd", l_0_0, bm.RelatedStringBMReport)
if this_sigattrlog[2].utf8p1 then
  bm.add_related_string("xsl_child", this_sigattrlog[2].utf8p1, bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1220", "SuspWmicXslExec")
return mp.INFECTED
