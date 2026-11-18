-- Threat: !InfrastructureShared
-- Name: 54b3f632cb70
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if string.match(l_0_0, "bypass.+hidden.+%-c%s*if%s*%(.+%)%s*%{.+net%.webclient.+downloadstring.+http.+|%s*iex%s*%}%s*else%s*%{.+net%.webclient.+downloadstring.+http.+|%s*iex%s*%}") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
