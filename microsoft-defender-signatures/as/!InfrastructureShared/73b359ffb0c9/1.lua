-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b359ffb0c9\1.luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
local l_0_3 = nil
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
l_0_2 = (this_sigattrlog[3]).utf8p2
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) and ((string.find)(l_0_2, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or (string.find)(l_0_2, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or (string.find)(l_0_2, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or (string.find)(l_0_2, "^/private/tmp/[^/]+$", 1, false) or (string.find)(l_0_2, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_2, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_2, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_2, "^/private/tmp/[^/]+/[^/]+$", 1, false)) then
  (bm.trigger_sig)("BM_UnsignedProcCreatedUnsignedFile", l_0_2)
  return mp.INFECTED
end
return mp.CLEAN

