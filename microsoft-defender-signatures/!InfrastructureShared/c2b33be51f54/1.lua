-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c2b33be51f54\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
TrackPidAndTechniqueBM(l_0_0.ppid, "T1562.001", "mptamper-titokensteal")
local l_0_1 = nil
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).p2
  if not l_0_1 then
    return mp.CLEAN
  end
end
local l_0_2 = tonumber(readRegDQwordValue(l_0_1), 16)
if not l_0_2 then
  return mp.CLEAN
end
;
(bm.add_related_string)("OldValue", tostring(l_0_2), bm.RelatedStringBMReport)
return mp.INFECTED

