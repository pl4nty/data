-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b3a533b1d1\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS((this_sigattrlog[2]).utf8p2) or IsExcludedByImagePathMacOS((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC47: Overwrote pending register: R0 in 'AssignReg'

local l_0_0 = nil
if SuspMacPathsToMonitor(l_0_0, true) and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_0)) then
  return mp.INFECTED
end
return mp.CLEAN

