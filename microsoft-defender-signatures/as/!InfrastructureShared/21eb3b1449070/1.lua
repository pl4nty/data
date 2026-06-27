-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21eb3b1449070\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_0 == nil then
    return l_1_1
  end
  if l_1_1 == nil then
    return l_1_0
  end
  if l_1_1 < l_1_0 then
    return l_1_1
  end
  return l_1_0
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  if l_2_0 ~= nil and l_2_0.matched and l_2_0.timestamp ~= nil then
    return l_2_0.timestamp
  end
  return nil
end

local l_0_2 = l_0_1(this_sigattrlog[8])
l_0_2 = l_0_0(l_0_2, l_0_1(this_sigattrlog[9]))
local l_0_3 = l_0_1(this_sigattrlog[10])
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[11]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[12]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[13]))
if l_0_2 == nil or l_0_3 == nil or l_0_3 <= l_0_2 then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

