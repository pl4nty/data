-- Threat: !InfrastructureShared
-- Name: 193b3ee67a8e0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = l_0_0
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "\\start menu\\programs\\startup\\",
  "\\microsoft\\templates\\",
  "\\microsoft\\word\\startup\\",
  "\\microsoft\\excel\\xlstart\\"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_5, 1, true) then
    l_0_3 = true
    break
  end
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_6 = bm.get_imagepath()
if not isnull(l_0_6) then
  local l_0_7 = string.lower(l_0_6)
  if string.find(l_0_7, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_8
local l_0_9 = mp.GetExecutablesFromCommandLine(l_0_1)
if not isnull(l_0_9) then
  if l_0_9[2] ~= nil then
    l_0_8 = l_0_9[2]
  elseif l_0_9[1] ~= nil then
    l_0_8 = l_0_9[1]
  end
end
bm.add_related_string("ScriptCmdline", l_0_1, bm.RelatedStringBMReport)
if l_0_8 ~= nil and sysio.IsFileExists(l_0_8) then
  bm.add_related_file(l_0_8)
  bm.add_threat_file(l_0_8)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1059.005", "startup_script_exec")
TrackPidAndTechniqueBM("BM", "T1547.001", "startup_persistence_exec")
return mp.INFECTED
