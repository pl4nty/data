-- Threat: !InfrastructureShared
-- Name: 7eb31e5265ee
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if string.match(l_0_0, "bypass.+%-c.+servercertificatevalidationcallback.*=.*%{.*%$true.+iex.+system%.net%.webclient.+downloadstring.+http") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
