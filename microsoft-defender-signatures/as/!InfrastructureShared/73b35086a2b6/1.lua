-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b35086a2b6\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

local l_0_0 = nil
if l_0_0:match("/%.[^/]+$") then
  return mp.INFECTED
end
return mp.CLEAN

