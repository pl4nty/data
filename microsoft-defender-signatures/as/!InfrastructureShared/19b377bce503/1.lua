-- Threat: !InfrastructureShared
-- Name: 19b377bce503
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\program files", 1, true) then
    return mp.CLEAN
  end
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
    local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
    local l_0_2 = {}
    table.insert(l_0_2, l_0_1)
    MpCommon.SetPersistContextNoPath("VolatileEnv_systemroot", l_0_2, 5)
    return mp.INFECTED
  end
end
return mp.CLEAN
