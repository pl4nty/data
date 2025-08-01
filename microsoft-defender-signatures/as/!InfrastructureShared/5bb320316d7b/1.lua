-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb320316d7b\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= "" and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0 = (this_sigattrlog[2]).utf8p2
    if SuspMacPathsToMonitor(l_0_0, true) or (string.find)(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Desktop/", 1, false) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

