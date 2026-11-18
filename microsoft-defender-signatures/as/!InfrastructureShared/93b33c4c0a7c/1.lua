-- Threat: !InfrastructureShared
-- Name: 93b33c4c0a7c
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 ~= nil and string.find(l_0_0, ".dll", -4, true) and string.find(l_0_0, "_31bf3856ad364e35\\", 1, true) == nil then
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
