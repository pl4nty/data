-- Threat: !InfrastructureShared
-- Name: 61b306e52fa4
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "M")
end
if this_sigattrlog[3].matched == true then
  local l_0_1 = this_sigattrlog[3].ppid
  if l_0_1 ~= nil and 1 < #l_0_1 then
    bm.request_SMS(l_0_1, "M")
  end
end
return mp.INFECTED
