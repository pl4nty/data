-- Threat: !InfrastructureShared
-- Name: 58b38b25bc6d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
if not string.find(l_0_0, "\\.node", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "\\electron", 1, true) or string.find(l_0_0, "\\resources\\", 1, true) or string.find(l_0_0, "\\app.asar", 1, true)
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "better-sqlite3.node",
  "sharp.node",
  "fsevents.node",
  "keytar.node",
  "node-pty.node",
  "nsfw.node",
  "sodium-native.node"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_5, 1, true) then
    return mp.CLEAN
  end
end
local l_0_6 = {
  "coffloader.node",
  "scexec.node",
  "assembly.node",
  "inject.node",
  "shellcode.node",
  "payload.node",
  "beacon.node",
  "implant.node"
}
local l_0_7 = false
local l_0_8
for l_0_9, l_0_10 in ipairs(l_0_6) do
  if string.find(l_0_0, l_0_10, 1, true) then
    l_0_7 = true
    l_0_8 = l_0_10
    break
  end
end
bm.add_related_string("susp_node_module", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("susp_node_proc", l_0_1, bm.RelatedStringBMReport)
if l_0_7 then
  bm.add_related_string("susp_node_known_tool", l_0_8, bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1218.015", "SuspNodeModule")
return mp.INFECTED
