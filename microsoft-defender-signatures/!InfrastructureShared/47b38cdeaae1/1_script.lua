-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\47b38cdeaae1\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeyValue("IsExchgServerTainted", "MpEnableTaintTracking")
do
  if l_0_0 ~= nil then
    local l_0_1 = nil
    if (this_sigattrlog[1]).matched then
      l_0_1 = (this_sigattrlog[1]).utf8p2
    end
    if l_0_1 ~= nil then
      (bm.add_related_string)("FTATAdpativeServerTool", l_0_1, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

