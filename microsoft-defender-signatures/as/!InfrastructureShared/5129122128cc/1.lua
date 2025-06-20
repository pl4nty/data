-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5129122128cc\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Nscript:Type_ps") or (mp.get_mpattribute)("PACKED_WITH:[CMDEmbedded]") or (mp.get_mpattribute)("PACKED_WITH:[CMDInlineScript]") then
  return mp.INFECTED
end
return mp.CLEAN

