-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d1b3297f6e8e\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[3]).matched and (this_sigattrlog[1]).utf8p1 and (this_sigattrlog[3]).utf8p1 then
  local l_0_0 = (this_sigattrlog[1]).utf8p1
  local l_0_1 = l_0_0:match("[^\\]+$")
  local l_0_2 = (this_sigattrlog[3]).utf8p1
  local l_0_3 = l_0_2:match("[^\\]+$")
  if l_0_0 and l_0_3 then
    local l_0_4 = (l_0_1:match("(.+)%.ico+")):lower()
    local l_0_5 = (l_0_3:match("(.+)%.README.txt+")):lower()
    if l_0_4 and l_0_5 and l_0_4 == l_0_5 then
      reportTimingData()
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

