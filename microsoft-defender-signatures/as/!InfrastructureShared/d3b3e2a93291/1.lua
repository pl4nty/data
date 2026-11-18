-- Threat: !InfrastructureShared
-- Name: d3b3e2a93291
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and MpCommon.GetPersistContextCountNoPath("Lua:MSIL/Quiltran.D") > 0 then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = MpCommon.GetPersistContextNoPath("Lua:MSIL/Quiltran.D")
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if string.find(l_0_0, l_0_3) then
        bm.add_action("EmsScan", 3000)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
