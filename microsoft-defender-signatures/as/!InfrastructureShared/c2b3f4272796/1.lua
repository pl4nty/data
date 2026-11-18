-- Threat: !InfrastructureShared
-- Name: c2b3f4272796
-- Type: 21

if bm.GetSignatureMatchDuration() > 200000000 then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = string.match(this_sigattrlog[5].utf8p2, ";regionsize:(%d+)")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ";destport=80;", 1, true) or string.find(l_0_0, ";destport=443;", 1, true) then
    return mp.CLEAN
  end
  if tonumber(l_0_1) < 110000 then
    return mp.CLEAN
  end
  local l_0_2 = bm.get_current_process_startup_info()
  bm.request_SMS(l_0_2.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 1000)
  return mp.INFECTED
end
return mp.CLEAN
