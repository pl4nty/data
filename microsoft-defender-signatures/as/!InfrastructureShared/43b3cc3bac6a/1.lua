-- Threat: !InfrastructureShared
-- Name: 43b3cc3bac6a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "M")
end
if this_sigattrlog[2].matched == true then
  local l_0_1 = this_sigattrlog[2].ppid
  if l_0_1 ~= nil then
    bm.request_SMS(l_0_1, "M")
  end
end
return mp.INFECTED
