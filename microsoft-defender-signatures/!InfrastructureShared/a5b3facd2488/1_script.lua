-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a5b3facd2488\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[6]).utf8p2 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

local l_0_0 = nil
if (string.find)(l_0_0, " -x ", 1, true) or (string.find)((string.lower)(l_0_0), " -u ", 1, true) or (string.find)(l_0_0, " -s ", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1087.001", "Discovery_Local_Account_dsmemberutil")
else
  if (string.find)(l_0_0, " -X ", 1, true) or (string.find)((string.lower)(l_0_0), " -g ", 1, true) or (string.find)(l_0_0, " -S ", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1087.002", "Discovery_Group_Account_dsmemberutil")
  else
    TrackPidAndTechniqueBM("BM", "T1087", "Discovery_Group_Account_dsmemberutil")
  end
end
return mp.INFECTED

