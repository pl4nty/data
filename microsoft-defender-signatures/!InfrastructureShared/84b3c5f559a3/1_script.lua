-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3c5f559a3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[2]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (string.match)(l_0_0.utf8p2, "([0-9]+);localvmallocregionsize:([0-9]+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
l_0_2 = tonumber(l_0_2)
if l_0_2 < 100000 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (string.match)(l_0_0.utf8p1, "targetprocessppid:(%d+):(%d+)")
if isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
end
l_0_3 = tonumber(l_0_3)
l_0_4 = tonumber(l_0_4)
local l_0_5 = (string.format)("pid:%d,ProcessStart:%d", l_0_3, l_0_4)
local l_0_6, l_0_7 = (bm.VirtualQuery)(l_0_1, l_0_5)
if not l_0_6 or l_0_7.prot ~= 64 or l_0_7.state_type ~= (mp.bitor)(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
  return mp.CLEAN
end
TriggerTargetedMemoryScan(l_0_1, l_0_5)
local l_0_8 = (bm.ReadProcMem)(l_0_1, 256, l_0_5)
do
  if l_0_8 ~= nil then
    local l_0_9 = (mp.readu_u32)(l_0_8, 1)
    if l_0_9 == 9460301 then
      TrackPidAndTechniqueBM(l_0_5, "T1055.002", "pe_injection_target")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

