-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3d83e2596\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall((bm.GetMemQueryCount)())
if l_0_1 ~= nil and l_0_1 > 0 then
  local l_0_2 = nil
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_2 = (this_sigattrlog[2]).utf8p2
    ;
    (bm.add_related_string)("MQp2", l_0_2, bm.RelatedStringBMReport)
    local l_0_3 = (bm.get_current_process_startup_info)()
    if l_0_3 ~= nil and l_0_3.ppid ~= nil then
      AddResearchData(l_0_3.ppid, true)
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

