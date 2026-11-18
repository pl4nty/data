-- Threat: !InfrastructureShared
-- Name: 2d2911cd5db4
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  local l_0_0 = tostring(headerpage)
  l_0_0 = string.lower(l_0_0:gsub("`", "", 100))
  if string.find(l_0_0, "new-object", 1, true) or string.find(l_0_0, "webclient", 1, true) or string.find(l_0_0, "newscriptblock", 1, true) or string.find(l_0_0, "executioncontext", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
