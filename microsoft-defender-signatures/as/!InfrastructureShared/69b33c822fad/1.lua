-- Threat: !InfrastructureShared
-- Name: 69b33c822fad
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
else
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if mp.bitand(l_0_5.reason_ex, 1) == 1 and IsTacticObservedForPid(l_0_5.ppid, "webserver_childproc") then
    local l_0_6 = l_0_5.image_path
    if l_0_6 == nil then
      l_0_6 = "none"
    end
    local l_0_7 = l_0_5.cmd_line
    if l_0_7 == nil then
      l_0_7 = "none"
    end
    table.insert(l_0_1, l_0_6 .. "_" .. l_0_7)
    TrackPidAndTechniqueBM(l_0_0.ppid, "T1190", "webserver_childproc", 7200)
  end
end
if IsTacticObservedForPid(l_0_0.ppid, "webserver_childproc") then
  local l_0_8 = bm.get_current_process_startup_info()
  if l_0_8 ~= nil and l_0_8.command_line ~= nil then
    table.insert(l_0_1, "self_" .. l_0_8.command_line)
  end
  bm.add_related_string("file_metadata", l_0_1, bm.RelatedStringBMReport)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
