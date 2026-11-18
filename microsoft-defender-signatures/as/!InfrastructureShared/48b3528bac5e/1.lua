-- Threat: !InfrastructureShared
-- Name: 48b3528bac5e
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if MpCommon.GetPersistContextCountNoPath("Lua:ExecPatpoopy.A") > 0 then
    local l_0_1 = MpCommon.GetPersistContextNoPath("Lua:ExecPatpoopy.A")
    if l_0_1 then
      for l_0_2, l_0_3 in ipairs(l_0_1) do
        local l_0_4 = string.match(l_0_3, "\\([^\\]+)$")
        if string.find(l_0_0, l_0_4, 1, true) then
          bm.add_action("EmsScan", 3000)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
