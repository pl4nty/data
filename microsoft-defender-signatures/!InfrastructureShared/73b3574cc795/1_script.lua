-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3574cc795\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[3]).utf8p1
local l_0_4 = (this_sigattrlog[3]).utf8p2
local l_0_5 = tonumber((string.match)(l_0_4, "oldmtime=(%d+);"))
local l_0_6 = tonumber((string.match)(l_0_4, "newmtime=(%d+);"))
local l_0_7 = (l_0_5 - l_0_6) / 3600000
if l_0_7 > 4 then
  local l_0_8 = (bm.get_imagepath)()
  if l_0_8 == nil then
    return mp.CLEAN
  end
  local l_0_9 = "BM"
  do
    do
      if (string.find)(l_0_8, "/touch", -6, true) then
        local l_0_10 = (mp.GetParentProcInfo)()
        if l_0_10 ~= nil and l_0_10.ppid ~= nil then
          l_0_9 = l_0_10.ppid
        end
      end
      if l_0_9 == "BM" then
        (bm.trigger_sig)("MacTimeStompToPast", l_0_3)
      else
        ;
        (bm.trigger_sig)("MacTimeStompToPast", l_0_3, l_0_9)
      end
      TrackPidAndTechniqueBM("BM", "T1070.006", "DefenseEvasion_IndicatorRemoval_MacTimeStompToPast")
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

