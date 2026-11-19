-- Threat: !InfrastructureShared
-- Name: 25b3aff2e9b8
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil then
    local l_0_4 = "browser_childproc"
    if l_0_3.reason == bm.RELATIONSHIP_CREATED then
      l_0_4 = "browser_childproc_created"
    elseif l_0_3.reason == bm.RELATIONSHIP_INJECTION then
      l_0_4 = "browser_childproc_injected"
    elseif l_0_3.reason == bm.RELATIONSHIP_INHERITED then
      l_0_4 = "browser_childproc_inherited"
    end
    bm.trigger_sig_target_propagate("BM:BrowserChildProc.A", l_0_4, l_0_3.ppid)
  end
end
return mp.CLEAN
