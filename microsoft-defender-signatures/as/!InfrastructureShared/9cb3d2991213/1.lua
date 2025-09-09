-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3d2991213\1.luac 

-- params : ...
-- function num : 0
local l_0_1, l_0_2 = nil, nil
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p1 == "" or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC69: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

if l_0_3 ~= nil and nil ~= nil and l_0_3 ~= "" and l_0_3:lower() == (nil):lower() then
  return mp.INFECTED
end
return mp.CLEAN

