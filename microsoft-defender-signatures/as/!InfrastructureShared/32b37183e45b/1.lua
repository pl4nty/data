-- Threat: !InfrastructureShared
-- Name: 32b37183e45b
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = "AadTenantID"
local l_0_1 = GetRollingQueueKeys(l_0_0)
local l_0_2
if l_0_1 and type(l_0_1) == "table" and l_0_1[1] then
  l_0_2 = l_0_1[1]
else
  local l_0_3 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\CloudDomainJoin\\TenantInfo\\"
  local l_0_4 = sysio.RegOpenKey(l_0_3)
  if l_0_4 then
    local l_0_5 = sysio.RegEnumKeys(l_0_4)
    if l_0_5 then
      for l_0_6, l_0_7 in ipairs(l_0_5) do
        if l_0_7 and type(l_0_7) == "string" and l_0_7:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
          l_0_2 = l_0_7
          local l_0_8 = 2592000
          local l_0_9 = 10
          AppendToRollingQueue(l_0_0, l_0_2, 1, l_0_8, l_0_9)
          break
        end
      end
    end
  end
end
if l_0_2 then
  bm.add_related_string("aadtenantid", l_0_2, bm.RelatedStringBMReport)
end
return mp.INFECTED
