-- Threat: !InfrastructureShared
-- Name: 131b392d22c50
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if l_0_0 ~= nil and string.find(l_0_0, "\\msbuild.exe", 1, true) then
    bm.add_action("EmsScan", 5000)
    return mp.INFECTED
  end
end
return mp.CLEAN
