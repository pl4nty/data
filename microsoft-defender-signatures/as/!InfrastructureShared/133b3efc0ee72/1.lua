-- Threat: !InfrastructureShared
-- Name: 133b3efc0ee72
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not (this_sigattrlog[2].matched and this_sigattrlog[3].matched) or not this_sigattrlog[4].matched then
  return mp.CLEAN
end
if this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
if string.find(l_0_0, "\\node_modules\\", 1, true) then
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
local l_0_2 = {
  "\\microsoft teams\\",
  "\\teams\\",
  "\\microsoft\\teams\\",
  "\\visual studio code\\",
  "\\programs\\microsoft vs code\\",
  "\\code - insiders\\",
  "\\cursor\\",
  "\\windsurf\\",
  "\\slack\\",
  "\\discord\\",
  "\\spotify\\",
  "\\1password\\",
  "\\notion\\",
  "\\figma\\",
  "\\postman\\",
  "\\obsidian\\",
  "\\signal\\",
  "\\whatsapp\\",
  "\\skype\\",
  "\\github desktop\\",
  "\\bitwarden\\",
  "\\mattermost\\",
  "\\wire\\",
  "\\hyper\\",
  "\\mongodb compass\\",
  "\\azure data studio\\",
  "\\logseq\\",
  "\\joplin\\",
  "\\standard notes\\",
  "\\twitch\\",
  "\\atom\\"
}
if contains(l_0_1, l_0_2, true) then
  return mp.CLEAN
end
local l_0_3 = {
  "coffloader.node",
  "scexec.node",
  "assembly.node",
  "inject.node",
  "shellcode.node",
  "payload.node",
  "beacon.node",
  "implant.node",
  "loader.node"
}
local l_0_4 = false
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_6, 1, true) then
    l_0_4 = true
    break
  end
end
local l_0_7 = {
  "better-sqlite3.node",
  "sharp.node",
  "fsevents.node",
  "keytar.node",
  "node-pty.node",
  "nsfw.node",
  "sodium-native.node",
  "registry.node",
  "kerberos.node",
  "onnxruntime"
}
local l_0_8 = false
for l_0_9, l_0_10 in ipairs(l_0_7) do
  if string.find(l_0_0, l_0_10, 1, true) then
    l_0_8 = true
    break
  end
end
if l_0_8 then
  return mp.CLEAN
end
bm.add_related_string("loki_c2_proc", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("loki_c2_nodemod", l_0_0, bm.RelatedStringBMReport)
if l_0_4 then
  bm.add_related_string("loki_c2_susp_module", "true", bm.RelatedStringBMReport)
end
if this_sigattrlog[4].utf8p1 then
  bm.add_related_string("loki_c2_action", this_sigattrlog[4].utf8p1, bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1059.007", "LokiC2Beacon")
TrackPidAndTechniqueBM("BM", "T1071.001", "LokiC2Comms")
return mp.INFECTED
