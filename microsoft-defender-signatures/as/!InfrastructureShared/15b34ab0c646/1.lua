-- Threat: !InfrastructureShared
-- Name: 15b34ab0c646
-- Type: 21

if mp.ENGINEBUILD >= 10134 then
  local l_0_0 = string.lower(bm.get_imagepath())
  if string.sub(l_0_0, -10) == "wrsa.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
