-- Threat: !InfrastructureShared
-- Name: 87b3298ae62e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or isnull(this_sigattrlog[2].utf8p2) then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
if not string.find(l_0_0, "127.0.0.1", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_0, "rmdir /s /q", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_0, "del /q", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.match(l_0_2, "([^\\/]+)$")
local l_0_4 = string.match(l_0_2, "^(.*)[\\/][^\\/]+$")
local l_0_6 = l_0_3 and string.find(l_0_0, l_0_3, 1, true) or l_0_4 and 3 < #l_0_4 and string.find(l_0_0, l_0_4, 1, true)
if not l_0_6 then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
bm.add_related_string("SELFDELETE_CMDLINE", this_sigattrlog[2].utf8p2, bm.RelatedStringBMReport)
bm.add_related_file(l_0_1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1070.004", "AntinoSelfDelete.AM")
return mp.INFECTED
