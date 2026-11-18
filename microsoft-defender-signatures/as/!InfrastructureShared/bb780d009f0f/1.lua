-- Threat: !InfrastructureShared
-- Name: bb780d009f0f
-- Type: 21

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 < 10 then
  return mp.CLEAN
end
local l_0_2 = {
  svr_create = 1,
  svr_start = 1,
  svr_stop = 1,
  svr_close = 1,
  svr_user_accept = 1,
  svr_user_get_wlan = 1,
  svr_user_recv_notify = 1,
  svr_user_send_notify = 1,
  svr_user_manager = 1,
  svr_user_close = 1
}
local l_0_3 = 0
for l_0_4 = 1, l_0_0 do
  local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
  if l_0_2[l_0_5] then
    l_0_3 = l_0_3 + l_0_2[l_0_5]
  end
end
if l_0_3 == 10 then
  return mp.INFECTED
end
return mp.CLEAN
