-- Threat: !InfrastructureShared
-- Name: 7ab340e94bf5
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
  local l_0_2, l_0_3 = string.match(l_0_1, "targetprocessppid:(%d+):(%d+)")
  if not l_0_2 or not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = string.format("pid:%s,ProcessStart:%s", l_0_2, l_0_3)
  bm.request_SMS(l_0_4, "M")
  bm.add_action("SmsAsyncScanEvent", 1000)
  bm.trigger_sig("BMGenericCodeInjector.C", l_0_0, l_0_4)
end
return mp.CLEAN
