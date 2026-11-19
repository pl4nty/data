-- Threat: !InfrastructureShared
-- Name: 84b37c25f9ed
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  if l_0_0 ~= nil then
    local l_0_1 = string.match(l_0_0, "\\docker\\windowsfilter\\[a-f0-9]*\\files\\windows\\")
    if l_0_1 ~= nil then
      local l_0_2 = string.match(l_0_0, "\\system32\\amsi.dll$")
      if l_0_2 ~= nil then
        return mp.CLEAN
      end
      l_0_2 = string.match(l_0_0, "\\syswow64\\amsi.dll$")
      if l_0_2 ~= nil then
        return mp.CLEAN
      end
    end
    local l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_0)
    if l_0_3 then
      local l_0_4 = string.lower(string.sub(l_0_3, 2, 11))
      if l_0_4 ~= ":\\windows\\" and l_0_4 ~= "system%\\am" then
        bm.add_related_file(l_0_0)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
