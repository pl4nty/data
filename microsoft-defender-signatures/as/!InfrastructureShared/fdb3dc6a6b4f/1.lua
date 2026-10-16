-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fdb3dc6a6b4f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return false
  end
  l_1_0 = (string.lower)(l_1_0)
  l_1_0 = l_1_0:gsub(" %(deleted%)$", "")
  do return l_1_0:match("^/var/catchpoint/agent/plugins/playwright/s%d+_%d+/%d+/%w%w%w%w%w%w%w%w%w%w%w?$") ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

do
  if not (this_sigattrlog[5]).matched and not (this_sigattrlog[6]).matched then
    local l_0_1 = nil
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
      l_0_1 = (this_sigattrlog[3]).utf8p1
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
        l_0_1 = (this_sigattrlog[4]).utf8p1
      end
    end
    if l_0_0(l_0_1) then
      return mp.CLEAN
    end
  end
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end

