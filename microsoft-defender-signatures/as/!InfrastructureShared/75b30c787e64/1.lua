-- Threat: !InfrastructureShared
-- Name: 75b30c787e64
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and (l_0_0:sub(1, 2) == "\\\\" or l_0_0:sub(1, 3) == "\"\\\\" or l_0_0:sub(1, 3) == "'\\\\") then
  if l_0_0:find("\\\\.+\\c%$\\") then
    TrackFileAndTechnique(l_0_0, "T1543.003:remote_svc_img_cdollar", 8000)
  elseif l_0_0:find("\\\\.+\\admin%$\\") then
    TrackFileAndTechnique(l_0_0, "T1543.003:remote_svc_img_adminshare", 8000)
  else
    TrackFileAndTechnique(l_0_0, "T1543.003:remote_svc_img_rndshare", 8000)
  end
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
