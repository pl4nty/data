-- Threat: !InfrastructureShared
-- Name: bbb35a53ad7d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
else
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = l_0_0.utf8p2
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:sub(-3) ~= "/sh" and l_0_1:sub(-5) ~= "/bash" and l_0_1:sub(-5) ~= "/dash" then
  return mp.CLEAN
end
local l_0_3 = l_0_2:find("/etc/shadow", 1, true) and l_0_2:find("/etc/krb5.keytab", 1, true)
local l_0_4 = l_0_2:find("find%s+/%s") and l_0_2:find("-iname", 1, true) and l_0_2:find("id_rsa", 1, true) and l_0_2:find(".pem", 1, true)
local l_0_5, l_0_6 = l_0_2:gsub("%f[%w]grep%f[%W]", "")
local l_0_8 = 2 <= l_0_6 and l_0_2:find("ssh", 1, true) and l_0_2:find("passw", 1, true) and l_0_2:find("secret", 1, true) and l_0_2:find("token", 1, true)
local l_0_9 = l_0_2:find("authorized_keys", 1, true) and l_0_2:find("/etc/sudoers", 1, true) and l_0_2:find("%f[%w]sudo%s+") and l_0_2:find("%-l%f[%W]")
if not l_0_3 and not l_0_4 and not l_0_8 and not l_0_9 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialReconSweep")
add_parents()
return mp.INFECTED
