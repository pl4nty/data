-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaJSAMSIS001\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(footerpage)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.gsub)(l_0_0, "%z", "")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = {}
l_0_3["www.w3.org"] = true
l_0_3["www.salesweb.jp"] = true
l_0_3["vkdj.org"] = true
l_0_3["utilities.pcpitstop.com"] = true
l_0_3["tile.thunderforest.com"] = true
l_0_3["switchboard.pcmatichome.com"] = true
l_0_3["switchboard.default.pcpitstop.com"] = true
l_0_3["schemas.xmlsoap.org"] = true
l_0_3["prod5.comcept.net"] = true
l_0_3["prod4.comcept.net"] = true
l_0_3["ny.cf.pcpitstop.com"] = true
l_0_3["login.microsoftonline.com"] = true
l_0_3["localhost.geoprostor.net"] = true
l_0_3["img.unitedconsumers.com"] = true
l_0_3["graph.microsoft.com"] = true
l_0_3["files.pcpitstop.com"] = true
l_0_3["az542455.vo.msecnd.net"] = true
l_0_3["api.weather.msn.com"] = true
l_0_3["api.slyp.com.au"] = true
l_0_3["10.125.31.183"] = true
local l_0_4 = nil
for l_0_8 in (string.gmatch)(l_0_1, "%.send.\"([A-Za-z0-9+/=]+)\"") do
  if l_0_8 ~= nil and l_0_8 ~= "" and (string.len)(l_0_8) >= 20 and (string.len)(l_0_8) <= 1000 then
    l_0_4 = (MpCommon.Base64Decode)(l_0_8)
    if l_0_4 ~= nil and l_0_4 ~= "" then
      (mp.set_mpattribute)("Lua:AMSI.JS.SendWithBase64Str.S1")
      break
    end
  end
end
do
  for l_0_12 in (string.gmatch)(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
    if l_0_12 ~= nil and l_0_12 ~= "" and (string.len)(l_0_12) >= 10 and (string.len)(l_0_12) <= 1000 then
      local l_0_13 = (string.gsub)(l_0_12, "%.", "_")
      ;
      (mp.set_mpattribute)("Lua:AMSI.JS.DomainWith4Parts.S1")
      ;
      (mp.set_mpattribute)("Lua:SuspDomain:" .. l_0_13)
      if not l_0_3[l_0_12] then
        (table.insert)(l_0_2, l_0_12)
      end
    end
  end
  for l_0_17 in (string.gmatch)(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
    if l_0_17 ~= nil and l_0_17 ~= "" and (string.len)(l_0_17) >= 4 and (string.len)(l_0_17) <= 1000 then
      local l_0_18 = (string.gsub)(l_0_17, "%.", "_")
      ;
      (mp.set_mpattribute)("Lua:AMSI.JS.DomainWith2Parts.S1")
      ;
      (mp.set_mpattribute)("Lua:SuspDomain:" .. l_0_18)
      if not l_0_3[l_0_17] then
        (table.insert)(l_0_2, l_0_17)
      end
    end
  end
  for l_0_22 in (string.gmatch)(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
    if l_0_22 ~= nil and l_0_22 ~= "" and (string.len)(l_0_22) >= 8 and (string.len)(l_0_22) <= 1000 and not l_0_3[l_0_22] then
      (table.insert)(l_0_2, l_0_22)
    end
  end
  l_0_2 = table_dedup(l_0_2)
  local l_0_23 = {}
  for l_0_27,l_0_28 in ipairs(l_0_2) do
    local l_0_29, l_0_30 = l_0_28:match("^([^:/?#]+)://(.+)$")
    if not l_0_29 then
      local l_0_31 = "http://"
      ;
      (table.insert)(l_0_23, l_0_31 .. l_0_28)
    else
      do
        do
          ;
          (table.insert)(l_0_23, l_0_28)
          -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  l_0_2 = l_0_23
  if l_0_2 == nil or #l_0_2 == 0 then
    return mp.CLEAN
  end
  local l_0_32 = {}
  l_0_32.SIG_CONTEXT = "LUA_GENERIC"
  l_0_32.CONTENT_SOURCE = "AMSI_JS"
  l_0_32.PROCESS_CONTEXT = "JS Caller"
  l_0_32.PARENT_CONTEXT = nil
  l_0_32.FILELESS = "true"
  l_0_32.CMDLINE_URL = "false"
  l_0_32.BREAK_AT_FIRST_HIT_MALWARE = "60"
  l_0_32.BREAK_AT_FIRST_HIT_PHISH = "60"
  local l_0_33 = CheckUrlReputationSimple(l_0_2, l_0_32, 60)
  if l_0_33 then
    (mp.set_mpattribute)("Lua:AMSI.JS.BadDomainFound.S1")
  end
  return mp.CLEAN
end

