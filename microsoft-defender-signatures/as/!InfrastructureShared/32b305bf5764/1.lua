-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b305bf5764\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 and (this_sigattrlog[1]).utf8p2 then
    local l_0_0 = (this_sigattrlog[1]).utf8p2
    ;
    (bm.trigger_sig_delayed)("Report_hmdprecisionpulsefullfilepathscan_statuscheck_10", l_0_0, 300000)
  end
  return mp.CLEAN
end

