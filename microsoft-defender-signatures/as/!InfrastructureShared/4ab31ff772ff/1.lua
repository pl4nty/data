-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab31ff772ff\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
local l_0_2 = (bm.get_current_process_startup_info)()
local l_0_3 = l_0_2.command_line
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_4 = nil
local l_0_5 = 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).np2 ~= nil then
  l_0_4 = (this_sigattrlog[2]).utf8p1
  l_0_5 = (this_sigattrlog[2]).np2
end
if l_0_4 == nil or l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = tonumber(tostring(l_0_5), 8)
local l_0_7, l_0_8, l_0_9, l_0_10 = (mp.bsplit)(l_0_6, 3)
if l_0_7 == 0 and l_0_8 == 0 and l_0_9 == 0 and l_0_10 == 0 then
  return mp.CLEAN
end
local l_0_11 = (bm.get_imagepath)()
if l_0_11 == nil then
  return mp.CLEAN
end
local l_0_12 = "BM"
if (string.find)(l_0_11, "/chmod", -6, true) then
  l_0_12 = l_0_0.ppid
end
local l_0_13 = false
if (mp.bitand)(l_0_7, 1) == 1 or (mp.bitand)(l_0_8, 1) == 1 or (mp.bitand)(l_0_9, 1) == 1 then
  if l_0_12 == "BM" then
    (bm.trigger_sig)("MacChmodToExec", l_0_4)
  else
    ;
    (bm.trigger_sig)("MacChmodToExec", l_0_4, l_0_12)
  end
  TrackPidAndTechniqueBM(l_0_12, "T1222.002", "DefenseEvasion_PermissionModification_MacChmodToExec")
  l_0_13 = true
end
if (mp.bitand)(l_0_10, 2) == 2 or (mp.bitand)(l_0_10, 4) == 4 then
  if l_0_12 == "BM" then
    (bm.trigger_sig)("UidGidChange", l_0_4)
  else
    ;
    (bm.trigger_sig)("UidGidChange", l_0_4, l_0_12)
  end
  TrackPidAndTechniqueBM(l_0_12, "T1548.001", "PrivilegeEscalation_AbuseElevationControlMechanism_MacSetuidSetgid")
  l_0_13 = true
end
if l_0_13 == false then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_4)
addRelatedProcess()
return mp.INFECTED

