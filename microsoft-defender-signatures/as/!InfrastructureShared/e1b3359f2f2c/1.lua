-- Threat: !InfrastructureShared
-- Name: e1b3359f2f2c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("SuspOwaAccess")
if l_0_0 ~= nil and type(l_0_0) == "table" then
  local l_0_1 = "["
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    l_0_1 = l_0_1 .. l_0_3 .. "|"
  end
  l_0_1 = l_0_1 .. "]"
  local l_0_4 = l_0_0[#l_0_0]
  local l_0_5 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
  if l_0_5 ~= nil and l_0_5 ~= "" and l_0_5 ~= "%ExchangeInstallPath%" then
    local l_0_6 = string.gsub(l_0_4, "/", "\\")
    l_0_6 = l_0_5 .. "FrontEnd\\HttpProxy" .. l_0_6
    bm.add_related_string("webshellcandidate", l_0_6, bm.RelatedStringBMReport)
    if sysio.IsFileExists(l_0_6) then
      local l_0_7 = string.match(l_0_6, "(.*\\)[^\\]+$")
      if l_0_7 then
        bm.add_related_string("webshellpaths", l_0_7, bm.RelatedStringBMReport)
      end
      bm.add_threat_file(l_0_6)
      mp.ReportLowfi(l_0_6, 679953091)
    end
  end
  bm.add_related_string("uri_list", l_0_1, bm.RelatedStringBMReport)
  local l_0_8, l_0_9 = pcall(reportBmInfo)
  if not l_0_8 and l_0_9 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_9), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
