-- Threat: !InfrastructureShared
-- Name: 32b3b52ac1bf
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = 3
while 0 < l_0_2 do
  if not l_0_1 or not l_0_1.ppid then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = bm.get_process_relationships(l_0_1.ppid)
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if l_0_6 and l_0_6.ppid then
      bm.trigger_sig("BM_WebServerFileDrop", l_0_0, l_0_6.ppid)
    end
  end
  l_0_1 = mp.GetParentProcInfo(l_0_1.ppid)
  l_0_2 = l_0_2 - 1
end
return mp.CLEAN
