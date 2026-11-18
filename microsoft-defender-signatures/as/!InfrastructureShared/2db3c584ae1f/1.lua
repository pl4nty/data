-- Threat: !InfrastructureShared
-- Name: 2db3c584ae1f
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, "wscript.shell", 1, true) and (string.find(l_0_0, "eval(", 1, true) or string.find(l_0_0, "'ev'+'al'", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
