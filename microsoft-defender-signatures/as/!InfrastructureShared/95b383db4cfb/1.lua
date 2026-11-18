-- Threat: !InfrastructureShared
-- Name: 95b383db4cfb
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_1 = l_0_0:match("^/.+/(.+)$")
  if l_0_1 ~= nil and string.sub(l_0_1, 1, 1) == "!" and string.sub(l_0_1, -5) == "!.txt" and l_0_1:len() > 10 and l_0_1:len() < 25 and reportGenericRansomwareRQ("genf_linux_ransom_meta") == mp.INFECTED then
    TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
    local l_0_2, l_0_3 = bm.get_process_relationships()
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
