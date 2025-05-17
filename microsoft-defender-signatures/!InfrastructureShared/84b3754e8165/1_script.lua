-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3754e8165\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
l_0_0.a738f2d8360e0243af067b2bb537c54d52bf679f = true
l_0_0["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
local l_0_1 = (versioning.GetOrgID)()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = scrubData(l_0_1)
if not l_0_0[l_0_2] then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[2]
if not l_0_3.matched then
  return mp.CLEAN
end
local l_0_4, l_0_5 = (string.match)(l_0_3.utf8p2, "([0-9]+);localvmallocregionsize:([0-9]+)")
if isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
l_0_4 = tonumber(l_0_4)
l_0_5 = tonumber(l_0_5)
if l_0_5 < 100000 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = (string.match)(l_0_3.utf8p1, "targetprocessppid:(%d+):(%d+)")
if isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
l_0_6 = tonumber(l_0_6)
l_0_7 = tonumber(l_0_7)
local l_0_8 = (string.format)("pid:%d,ProcessStart:%d", l_0_6, l_0_7)
local l_0_9, l_0_10 = (bm.VirtualQuery)(l_0_4, l_0_8)
if not l_0_9 or l_0_10.prot ~= 64 or l_0_10.state_type ~= (mp.bitor)(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
  return mp.CLEAN
end
TriggerTargetedMemoryScan(l_0_4, l_0_8)
local l_0_11 = (bm.ReadProcMem)(l_0_4, 256, l_0_8)
do
  if l_0_11 ~= nil then
    local l_0_12 = (mp.readu_u32)(l_0_11, 1)
    if l_0_12 == 9460301 then
      TrackPidAndTechniqueBM(l_0_8, "T1055.002", "pe_injection_target")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

