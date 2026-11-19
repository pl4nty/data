-- Threat: !InfrastructureShared
-- Name: 128b334b5c699
-- Type: 21

local l_0_0 = this_sigattrlog[7]
if not (l_0_0 and l_0_0.p1) or not l_0_0.p2 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
local l_0_2 = string.match(l_0_1, "Delay:(%d+);")
local l_0_3 = string.match(l_0_1, "Type:([%w_]+);")
local l_0_4 = string.match(l_0_1, "Origin:([%w:/%.%d]+);")
if not l_0_3 or not l_0_2 then
  return mp.CLEAN
end
l_0_3 = string.upper(l_0_3)
l_0_2 = tonumber(l_0_2)
if l_0_3:find("SMS_", 1, true) == 1 then
  local l_0_5 = l_0_3:sub(-1)
  if l_0_5 ~= "H" and l_0_5 ~= "M" and l_0_5 ~= "L" and l_0_5 ~= "1" then
    return mp.CLEAN
  end
  local l_0_6 = bm.get_current_process_startup_info()
  bm.request_SMS(l_0_6.ppid, l_0_5)
  bm.add_action("SmsAsyncScanEvent", l_0_2)
elseif l_0_3 == "EMS" then
  bm.add_action("EmsScan", l_0_2)
else
  return mp.CLEAN
end
if l_0_4 and l_0_4:find("Behavior:", 1, true) == 1 then
  bm.add_related_string("RelatedBMHits", l_0_4, bm.RelatedStringBMReport)
end
return mp.INFECTED
