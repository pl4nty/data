-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ddb373aa61ae\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  local l_0_0 = (this_sigattrlog[4]).utf8p1
  local l_0_1 = (this_sigattrlog[4]).utf8p2
  if l_0_0 ~= nil and l_0_1 ~= nil then
    AppendToRollingQueue("BmMsSenseComponentTamperA", l_0_0, l_0_1, 180)
  end
end
do
  return mp.INFECTED
end

