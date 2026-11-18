-- Threat: !InfrastructureShared
-- Name: 2db3ecb4b266
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = "rq_ServiceImagePaths"
  local l_0_1 = bm.get_imagepath()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_1:gsub("[.exe$|.sys$]", ""):lower()
  local l_0_2 = GetRollingQueueKeys(l_0_0)
  if l_0_2 == nil or type(l_0_2) ~= "table" then
    return mp.CLEAN
  end
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4:find(l_0_1, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
