-- Threat: !InfrastructureShared
-- Name: 1eb414d4421bc
-- Type: 21

if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[8].utf8p1
  if not (l_0_0 and l_0_0.matched) or not l_0_0.utf8p1 then
    return mp.CLEAN
  end
  local l_0_1 = tostring(l_0_0.utf8p1 or "")
  if l_0_1 == "" then
    return mp.CLEAN
  end
  
  local function l_0_2(l_1_0)
    if not l_1_0 or #l_1_0 < 8 then
      return false
    end
    if l_1_0:find("[^A-Za-z0-9%+/%-%_=]") then
      return false
    end
    local l_1_1, l_1_2 = l_1_0:match("^([A-Za-z0-9%+/%-%_]*)(=*)$")
    if not l_1_1 then
      return false
    end
    if l_1_2 and 2 < #l_1_2 then
      return false
    end
    return true
  end
  
  for l_0_3 in l_0_1:gmatch("([A-Za-z0-9_%-%+/=]+)") do
    if l_0_2(l_0_3) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
