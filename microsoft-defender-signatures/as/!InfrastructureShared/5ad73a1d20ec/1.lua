-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ad73a1d20ec\1.luac 

-- params : ...
-- function num : 0
if (hstrlog[2]).matched and (hstrlog[3]).matched then
  if (hstrlog[4]).matched or (hstrlog[5]).matched then
    return mp.INFECTED
  end
  if IsDetectionThresholdMet("CMDHSTR") then
    return mp.INFECTED
  end
end
return mp.CLEAN

