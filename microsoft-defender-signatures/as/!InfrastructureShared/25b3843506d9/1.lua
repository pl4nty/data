-- Threat: !InfrastructureShared
-- Name: 25b3843506d9
-- Type: 21

if mp.ENGINEBUILD >= 10134 then
  local l_0_0 = string.lower(bm.get_imagepath())
  if string.sub(l_0_0, -10) == "winrar.exe" or string.sub(l_0_0, -9) == "unrar.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
