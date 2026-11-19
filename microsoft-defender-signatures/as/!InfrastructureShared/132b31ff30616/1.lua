-- Threat: !InfrastructureShared
-- Name: 132b31ff30616
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_5 == bm.RELATIONSHIP_CREATED then
      bm.trigger_sig("FromSuspAutoScriptAU3", l_0_0, l_0_4.ppid)
    end
  end
end
return mp.INFECTED
