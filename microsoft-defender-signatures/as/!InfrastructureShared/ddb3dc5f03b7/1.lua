-- Threat: !InfrastructureShared
-- Name: ddb3dc5f03b7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if contains(l_0_0, {
  " /i ",
  " /q ",
  " -i ",
  " -q "
}) then
  local l_0_1 = string.match(l_0_0, "msiexec%.?e?x?e?\"?'?%s+(.*)$")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if contains(l_0_1, {".msi", ".exe"}) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
