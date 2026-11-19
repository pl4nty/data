-- Threat: !InfrastructureShared
-- Name: c9b3f1e3fd20
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
local l_0_1 = {
  "\\users\\",
  "\\temp\\",
  "\\tmp\\",
  "\\downloads\\",
  "\\desktop\\",
  "\\appdata\\",
  "\\programdata\\",
  "\\public\\"
}
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_4, 1, true) then
    l_0_2 = true
    break
  end
end
if not l_0_2 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\syswow64\\", 1, true) then
  return mp.CLEAN
end
bm.add_related_file(this_sigattrlog[3].utf8p1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1218.002", "SuspCplSideload")
return mp.INFECTED
