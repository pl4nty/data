-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b3772f3a15\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p1 ~= "" then
    local l_0_0 = (this_sigattrlog[1]).utf8p1
    if (string.find)(l_0_0, "/Volumes/", 1, true) ~= 1 or not (string.find)(l_0_0, ".app/Contents/MacOS/", 1, true) then
      return mp.CLEAN
    end
    if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_0)) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

