-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\64bb39e4fd9db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = "T1204"
-- DECOMPILER ERROR at PC13: Overwrote pending register: R2 in 'AssignReg'

if ((not (this_sigattrlog[17]).matched and not (this_sigattrlog[18]).matched) or (this_sigattrlog[16]).matched) and ((this_sigattrlog[16]).utf8p1 == nil or (this_sigattrlog[16]).utf8p1 == "" or not (string.match)(l_0_1, "/DAFOM%-%d+%.%d+%.%d+%.dmg$")) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC64: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P3

if ((this_sigattrlog[26]).matched or (this_sigattrlog[19]).matched) and ((((this_sigattrlog[26]).utf8p1 == nil or (this_sigattrlog[26]).utf8p1 == "" or (this_sigattrlog[19]).utf8p1 ~= nil) and l_0_1 == nil) or not (string.match)(l_0_1, "/DAFOM%-%d+%.%d+%.%d+%.app/")) then
  return mp.CLEAN
end
do
  if (this_sigattrlog[20]).matched or (this_sigattrlog[21]).matched or (this_sigattrlog[22]).matched or (this_sigattrlog[23]).matched or (this_sigattrlog[24]).matched or (this_sigattrlog[25]).matched or (this_sigattrlog[26]).matched then
    local l_0_3 = "Execution_UserExecution_ExactMatch"
    if IsExcludedByImagePathMacOS((bm.get_imagepath)()) then
      return mp.CLEAN
    end
  end
  -- DECOMPILER ERROR at PC139: Confused about usage of register: R2 in 'UnsetPending'

  TrackPidAndTechniqueBM("BM", l_0_2, l_0_3)
  return mp.INFECTED
end

