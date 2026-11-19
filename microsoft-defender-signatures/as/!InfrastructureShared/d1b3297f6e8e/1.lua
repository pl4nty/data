-- Threat: !InfrastructureShared
-- Name: d1b3297f6e8e
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[3].matched and this_sigattrlog[1].utf8p1 and this_sigattrlog[3].utf8p1 then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = l_0_0:match("[^\\]+$")
  local l_0_2 = this_sigattrlog[3].utf8p1
  local l_0_3 = l_0_2:match("[^\\]+$")
  if l_0_0 and l_0_3 then
    local l_0_4 = l_0_1:match("(.+)%.ico+"):lower()
    local l_0_5 = l_0_3:match("(.+)%.README.txt+"):lower()
    if l_0_4 and l_0_5 and l_0_4 == l_0_5 then
      reportTimingData()
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
