-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e1b3359f2f2c\0x000003ff_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeys("SuspOwaAccess")
if l_0_0 ~= nil and type(l_0_0) == "table" then
  local l_0_1 = "["
  for l_0_5,l_0_6 in ipairs(l_0_0) do
    l_0_1 = l_0_1 .. l_0_6 .. "|"
  end
  l_0_1 = l_0_1 .. "]"
  local l_0_7 = l_0_0[#l_0_0]
  local l_0_8 = (MpCommon.ExpandEnvironmentVariables)("%ExchangeInstallPath%")
  if l_0_8 ~= nil and l_0_8 ~= "" and l_0_8 ~= "%ExchangeInstallPath%" then
    local l_0_9 = (string.gsub)(l_0_7, "/", "\\")
    l_0_9 = l_0_8 .. "FrontEnd\\HttpProxy" .. l_0_9
    ;
    (bm.add_related_string)("webshellcandidate", l_0_9, bm.RelatedStringBMReport)
    if (sysio.IsFileExists)(l_0_9) then
      local l_0_10 = (string.match)(l_0_9, "(.*\\)[^\\]+$")
      if l_0_10 then
        (bm.add_related_string)("webshellpaths", l_0_10, bm.RelatedStringBMReport)
      end
      ;
      (bm.add_threat_file)(l_0_9)
      ;
      (mp.ReportLowfi)(l_0_9, 679953091)
    end
  end
  do
    do
      ;
      (bm.add_related_string)("uri_list", l_0_1, bm.RelatedStringBMReport)
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

