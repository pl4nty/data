-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b323e531cc\0x0000089c_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC38: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = nil
-- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = nil
-- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

if not (nil):match("/%.[^/]+$") and not (nil):match("^%.[^/]+$") then
  return mp.CLEAN
end
local l_0_3 = nil
local l_0_4 = (string.match)(l_0_1, "^/.*/")
if l_0_4 ~= (string.match)(l_0_3, "^/.*/") then
  return mp.CLEAN
end
l_0_2 = (bm.get_imagepath)()
if IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_5 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
local l_0_6 = nil
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_2)) then
  return mp.INFECTED
end
return mp.CLEAN

