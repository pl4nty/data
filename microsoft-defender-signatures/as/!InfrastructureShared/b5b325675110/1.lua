-- Threat: !InfrastructureShared
-- Name: b5b325675110
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = GetRollingQueueKeyValue("ExchgVersion", l_0_0)
if l_0_1 == nil then
  local l_0_2 = "ExchgVersion"
  local l_0_3 = 86400
  local l_0_4 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\ExchangeServer\\V15\\Setup")
  l_0_4 = l_0_4 or sysio.RegOpenKey("HKLM\\Software\\Microsoft\\ExchangeServer\\V14\\Setup")
  if not l_0_4 then
    bm.add_related_string("ExchgSetupErr", "true", bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  local l_0_5 = sysio.GetRegValueAsString(l_0_4, "OwaVersion") or "nil"
  if l_0_5 then
    AppendToRollingQueue(l_0_2, l_0_0, l_0_5, l_0_3)
    bm.add_related_string("ExchgVersion", l_0_5, bm.RelatedStringBMReport)
  end
else
  bm.add_related_string("ExchgVersion", l_0_1, bm.RelatedStringBMReport)
end
return mp.INFECTED
