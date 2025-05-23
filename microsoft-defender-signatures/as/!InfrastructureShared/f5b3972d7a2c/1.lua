-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5b3972d7a2c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if (l_0_1 ~= nil or l_0_1.ppid ~= nil) and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
if analyzeRansomwarePattern2(1) == mp.INFECTED then
  local l_0_2, l_0_3 = (bm.get_process_relationships)()
  for l_0_7,l_0_8 in ipairs(l_0_3) do
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
  end
  local l_0_9 = (bm.get_imagepath)()
  if l_0_9 ~= "" and l_0_9 ~= nil and check_common_process_linux(l_0_9) == false then
    (bm.add_threat_file)(l_0_9)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

