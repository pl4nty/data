-- Threat: !InfrastructureShared
-- Name: 19b32ceaaf64
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.match(l_0_0, "winword%.exe.+ /l(.+%.dll)")
  if l_0_1 ~= nil then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_1) then
      bm.add_related_file(l_0_1)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
