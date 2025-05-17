-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d1b3a5c06dfe\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

if not (this_sigattrlog[2]).matched or not (this_sigattrlog[2]).utf8p2 or nil == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

