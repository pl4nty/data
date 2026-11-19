-- Threat: !InfrastructureShared
-- Name: 13bb36bec0efe
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p1)
end
if l_0_2 ~= nil then
  l_0_0 = string.match(l_0_2, "\\([^\\]+%.exe)")
  if l_0_0 ~= nil then
    local l_0_3 = bm.get_imagepath()
    if l_0_3 ~= nil then
      l_0_1 = string.match(l_0_3, "\\([^\\]+%.exe)")
      if l_0_1 ~= nil and l_0_0 ~= l_0_1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
