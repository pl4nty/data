-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbb35a8f686f\1_luac 

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
if (sysio.IsFileExists)(l_0_0) then
  (bm.add_threat_file)(l_0_0)
end
return mp.INFECTED

