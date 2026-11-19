-- Threat: !InfrastructureShared
-- Name: 121b3c260122f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 == nil or this_sigattrlog[1].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = "/DAFOM%-tmp%w+$"
elseif this_sigattrlog[2].matched then
  if this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = "/Esilet%-tmp%w+$"
elseif this_sigattrlog[3].matched then
  if this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = "/silet%-tmp%w+$"
elseif this_sigattrlog[4].matched then
  if this_sigattrlog[4].utf8p1 == nil or this_sigattrlog[4].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = "/DAFOM%-tmp%w+$"
elseif this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p1 == nil or this_sigattrlog[5].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[5].utf8p1
  l_0_1 = "/Esilet%-tmp%w+$"
elseif this_sigattrlog[6].matched then
  if this_sigattrlog[6].utf8p1 == nil or this_sigattrlog[6].utf8p1 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[6].utf8p1
  l_0_1 = "/silet%-tmp%w+$"
end
if not string.match(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = bm.get_process_relationships()
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_5.ppid)
  end
end
TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter_ExactMatch")
return mp.INFECTED
