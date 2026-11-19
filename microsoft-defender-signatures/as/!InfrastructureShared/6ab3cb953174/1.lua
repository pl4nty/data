-- Threat: !InfrastructureShared
-- Name: 6ab3cb953174
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if string.match(l_0_0, "if%s*%(%s*!%s*%(%s*%[%s*string%s*%]%s*%(%s*get%-wmiobject%s*-namespace%s*root\\subscription%s*%-class%s*__filtertoconsumerbinding%s*%)%)%.contains%(%s*'scm event filter'%s*%)%).*%{.*iex.+net%.webclient.+downloadstring.+http.*%}") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
