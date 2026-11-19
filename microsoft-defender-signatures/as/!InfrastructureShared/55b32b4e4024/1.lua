-- Threat: !InfrastructureShared
-- Name: 55b32b4e4024
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[4].utf8p1)
  if l_0_0:match("([^\\]+)$") ~= l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = {
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["outlook.exe"] = true,
    ["olk.exe"] = true,
    ["splwow64.exe"] = true,
    ["deletelogfiles.exe"] = true,
    ["dw20.exe"] = true,
    ["microsoft.uev.synccontroller.exe"] = true
  }
  if l_0_2[l_0_1] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
