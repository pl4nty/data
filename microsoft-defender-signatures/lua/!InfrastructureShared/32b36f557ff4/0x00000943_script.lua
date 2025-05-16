-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b36f557ff4\0x00000943_luac 

-- params : ...
-- function num : 0
propagateTTParent = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  local l_1_3 = (mp.GetParentProcInfo)(l_1_0)
  if l_1_3 == nil then
    return 
  end
  l_1_0 = l_1_3.ppid
  if l_1_0 == nil then
    return 
  end
  TrackPidAndTechniqueBM(l_1_0, l_1_1, l_1_2)
  return 
end

local l_0_0, l_0_1, l_0_2, l_0_3 = nil, nil, nil, nil
local l_0_4 = (bm.get_current_process_startup_info)()
local l_0_5 = l_0_4.command_line
local l_0_6 = (bm.get_imagepath)()
if (this_sigattrlog[1]).matched then
  l_0_0 = (this_sigattrlog[1]).utf8p1
  l_0_1 = (this_sigattrlog[1]).utf8p2
  l_0_2 = (this_sigattrlog[1]).ppid
  l_0_3 = (this_sigattrlog[1]).image_path
end
if not l_0_0 or not l_0_1 or not l_0_2 or not l_0_3 or not l_0_5 then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_5) or IsExcludedByImagePathMacOS(l_0_6) then
  return mp.CLEAN
end
if not (string.match)(l_0_0, "T%d%d%d%d") or l_0_1 == "INFECTED" then
  return mp.CLEAN
end
local l_0_7 = GetTechniquesCountForPid(l_0_2)
if l_0_7 ~= nil and l_0_7 > 1 then
  (bm.trigger_sig)("SuspiciousMacTTPRel", "Detected")
end
propagateTTParent(l_0_2, l_0_0, l_0_1)
return mp.CLEAN

