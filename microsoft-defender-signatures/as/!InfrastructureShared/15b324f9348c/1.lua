-- Threat: !InfrastructureShared
-- Name: 15b324f9348c
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = GetRollingQueueKeyValue("SPVersion", l_0_0)
if l_0_1 == nil then
  local l_0_2 = "SPVersion"
  local l_0_3, l_0_4
  local l_0_5 = 86400
  local l_0_6 = {
    "14.0",
    "15.0",
    "16.0"
  }
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    local l_0_9 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\" .. l_0_8 .. "\\WSS")
    if l_0_9 then
      l_0_4 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\" .. l_0_8)
      l_0_3 = l_0_8
    end
  end
  if l_0_4 then
    local l_0_10 = sysio.GetRegValueAsString(l_0_4, "Version") or "nil"
    if l_0_10 then
      local l_0_11 = l_0_10:match("%.([^%.]+)$")
      if l_0_11 then
        local l_0_12 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\" .. l_0_3 .. "\\InstalledLanguages")
        local l_0_13 = sysio.RegEnumValues(l_0_12)
        for l_0_14, l_0_15 in pairs(l_0_13) do
          local l_0_16 = string.lower(sysio.GetRegValueAsString(l_0_12, l_0_15))
          if l_0_16 and string.find(l_0_16, l_0_11, 1, true) then
            AppendToRollingQueue(l_0_2, l_0_0, l_0_16, l_0_5)
            bm.add_related_string("SPFullVersion", l_0_16, bm.RelatedStringBMReport)
          end
        end
      end
      AppendToRollingQueue(l_0_2, l_0_0, l_0_10, l_0_5)
      bm.add_related_string("SPVersion", l_0_10, bm.RelatedStringBMReport)
    end
  end
else
  bm.add_related_string("SPVersion", l_0_1, bm.RelatedStringBMReport)
end
return mp.INFECTED
