-- Threat: !InfrastructureShared
-- Name: 69b3c4af2d04
-- Type: 21

if bm.GetSignatureMatchDuration() > 40000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, "\\program files", 1, true) then
    return mp.CLEAN
  end
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
