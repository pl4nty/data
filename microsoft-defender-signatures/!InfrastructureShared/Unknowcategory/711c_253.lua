-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\711c_253.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.GetPersistContextNoPath)("BitlockerRansom")
if l_0_0 ~= nil then
  for l_0_4,l_0_5 in ipairs(l_0_0) do
    if l_0_5 == "D" then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

