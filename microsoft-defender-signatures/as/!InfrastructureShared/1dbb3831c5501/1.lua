-- Threat: !InfrastructureShared
-- Name: 1dbb3831c5501
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 then
  local l_0_1 = sysio.GetPEVersionInfo(l_0_0)
  if l_0_1 and l_0_1.OriginalFilename == "bootmgr.exe" and (l_0_1.ProductVersion == "10.0.19041.1288" or l_0_1.ProductVersion == "10.0.19041.1157") then
    return mp.INFECTED
  end
end
return mp.CLEAN
