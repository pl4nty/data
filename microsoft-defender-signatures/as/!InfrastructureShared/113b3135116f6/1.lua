-- Threat: !InfrastructureShared
-- Name: 113b3135116f6
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = sysio.RegOpenKey(string.sub(l_0_0, 1, -10))
if l_0_1 then
  local l_0_2 = sysio.GetRegValueAsBinary(l_0_1, "element")
  if l_0_2 and (1 < #l_0_2 or string.byte(l_0_2) ~= 0) then
    return mp.INFECTED
  end
end
return mp.CLEAN
