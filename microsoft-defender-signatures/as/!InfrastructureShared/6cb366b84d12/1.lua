-- Threat: !InfrastructureShared
-- Name: 6cb366b84d12
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p1
  local l_0_1, l_0_2 = string.match(l_0_0, "targetprocessppid:(%d+):(%d+)")
  if not l_0_1 or not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = string.format("pid:%s,ProcessStart:%s", l_0_1, l_0_2)
  bm.request_SMS(l_0_3, "1")
  bm.add_action("SmsAsyncScanEvent", 1)
end
return mp.INFECTED
