-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb33a7595c1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.AtomicCounterValue)("Fragnesia-Burst")
if not l_0_0 or l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
do
  if l_0_1 ~= nil and l_0_1.image_path ~= nil then
    local l_0_2 = l_0_1.image_path
    if (string.match)(l_0_2, "/bash$") or (string.match)(l_0_2, "/sh$") or (string.match)(l_0_2, "/zsh$") or (string.match)(l_0_2, "/ksh$") or (string.match)(l_0_2, "/fish$") or (string.match)(l_0_2, "/dash$") or (string.match)(l_0_2, "/sshd$") or (string.match)(l_0_2, "/login$") or (string.match)(l_0_2, "/tmux") or (string.match)(l_0_2, "/screen$") or (string.match)(l_0_2, "/xterm$") or (string.match)(l_0_2, "/konsole$") or (string.match)(l_0_2, "/gnome%-terminal") or (string.match)(l_0_2, "/sudo$") or (string.match)(l_0_2, "/polkit$") or (string.match)(l_0_2, "/pam_exec") then
      return mp.CLEAN
    end
  end
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1068", "PrivilegeEscalation_Fragnesia")
  return mp.INFECTED
end

