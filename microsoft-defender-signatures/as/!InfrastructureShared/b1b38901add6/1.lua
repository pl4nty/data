-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b1b38901add6\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC38: Overwrote pending register: R0 in 'AssignReg'

local l_0_0 = nil
-- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = nil
-- DECOMPILER ERROR at PC47: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = nil
if l_0_2 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1, l_0_2) then
  if (sysio.IsFileExists)(l_0_0) then
    (bm.add_threat_file)(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN

