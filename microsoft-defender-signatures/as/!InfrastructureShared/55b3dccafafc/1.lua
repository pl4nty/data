-- Threat: !InfrastructureShared
-- Name: 55b3dccafafc
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\windows\\", 1, true) or string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\programdata\\", 1, true) or string.find(l_0_0, "\\blender", 1, true) or string.find(l_0_0, "\\glens", 1, true) or string.find(l_0_0, "\\microsoft.azure.", 1, true)) then
  return mp.CLEAN
end
if MpCommon.GetPersistContextCountNoPath("Lua:Metload.A") > 0 then
  local l_0_1 = MpCommon.GetPersistContextNoPath("Lua:Metload.A")
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if l_0_0 == l_0_3 then
        bm.add_action("EmsScan", 3000)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
