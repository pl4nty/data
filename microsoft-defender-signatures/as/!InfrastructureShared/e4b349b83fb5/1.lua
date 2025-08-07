-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e4b349b83fb5\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
    local l_0_0 = (this_sigattrlog[5]).utf8p2
    if l_0_0:find(" /Applications/", 1, true) or l_0_0:find(" /tmp/", 1, true) or l_0_0:find(" /private/tmp/", 1, true) or l_0_0:find(" /Users/Shared/", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

