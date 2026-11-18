-- Threat: !InfrastructureShared
-- Name: 97b37e4bbacb
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
  if l_0_0:len() > 13 and string.sub(l_0_0, -13) == "\\win32spl.dll" then
    local l_0_1 = string.lower(bm.get_imagepath())
    if string.sub(l_0_1, -11) == "svchost.exe" then
      return mp.CLEAN
    end
  end
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
