-- Threat: !InfrastructureShared
-- Name: 207b369d195c0
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.ppid ~= nil then
    bm.trigger_sig_target_propagate("ttexclusion", "ttexclusion-parentex", l_0_3.ppid)
  end
end
return mp.CLEAN
