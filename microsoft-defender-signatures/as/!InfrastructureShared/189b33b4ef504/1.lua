-- Threat: !InfrastructureShared
-- Name: 189b33b4ef504
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil and l_0_1.ppid ~= nil and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
if analyzeRansomwarePattern4(1) == mp.INFECTED then
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
  end
  local l_0_6 = bm.get_imagepath()
  if l_0_6 ~= "" and l_0_6 ~= nil and check_common_process_linux(l_0_6) == false then
    bm.add_threat_file(l_0_6)
  end
  return mp.INFECTED
end
return mp.CLEAN
