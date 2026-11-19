-- Threat: !InfrastructureShared
-- Name: 25b38858c336
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_imagepath()
local l_0_1
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_2 = GetRollingQueueKeyValue("SpPatchVersion", l_0_0)
if l_0_2 == nil then
  local l_0_3 = "SpPatchVersion"
  local l_0_4 = 86400
  local l_0_5 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  local l_0_6 = sysio.RegOpenKey(l_0_5)
  if not l_0_6 then
    return mp.CLEAN
  end
  local l_0_7 = sysio.RegEnumKeys(l_0_6)
  if not l_0_7 then
    return mp.CLEAN
  end
  for l_0_8, l_0_9 in pairs(l_0_7) do
    if string.find(l_0_9, "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) or string.find(l_0_9, "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) or string.find(l_0_9, "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) then
      do
        local l_0_10 = sysio.RegOpenKey(l_0_5 .. "\\" .. l_0_9)
        if l_0_10 then
          l_0_2 = sysio.GetRegValueAsString(l_0_10, "DisplayVersion")
          if l_0_2 ~= nil then
            AppendToRollingQueue(l_0_3, l_0_0, l_0_2, l_0_4)
            bm.add_related_string("SpPatchVersion", l_0_2, bm.RelatedStringBMReport)
            do return mp.INFECTED end
            break
          end
          l_0_1 = sysio.GetRegValueAsString(l_0_10, "DisplayName")
          if l_0_1 ~= nil then
            AppendToRollingQueue(l_0_3, l_0_0, l_0_1, l_0_4)
            bm.add_related_string("SpPatchVersion", l_0_1, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
      break
    end
  end
else
  bm.add_related_string("SpPatchVersion", l_0_2, bm.RelatedStringBMReport)
end
return mp.INFECTED
