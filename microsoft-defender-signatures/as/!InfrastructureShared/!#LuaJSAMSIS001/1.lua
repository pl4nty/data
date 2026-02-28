local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = tostring
L1_1 = footerpage
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.gsub
L2_1 = L0_1
L3_1 = "%z"
L4_1 = ""
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = {}
L3_1["www.w3.org"] = true
L3_1["www.salesweb.jp"] = true
L3_1["vkdj.org"] = true
L3_1["utilities.pcpitstop.com"] = true
L3_1["tile.thunderforest.com"] = true
L3_1["switchboard.pcmatichome.com"] = true
L3_1["switchboard.default.pcpitstop.com"] = true
L3_1["schemas.xmlsoap.org"] = true
L3_1["prod5.comcept.net"] = true
L3_1["prod4.comcept.net"] = true
L3_1["ny.cf.pcpitstop.com"] = true
L3_1["login.microsoftonline.com"] = true
L3_1["localhost.geoprostor.net"] = true
L3_1["img.unitedconsumers.com"] = true
L3_1["graph.microsoft.com"] = true
L3_1["files.pcpitstop.com"] = true
L3_1["az542455.vo.msecnd.net"] = true
L3_1["api.weather.msn.com"] = true
L3_1["api.slyp.com.au"] = true
L3_1["10.125.31.183"] = true
L4_1 = nil
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L1_1
L7_1 = "%.send.\"([A-Za-z0-9+/=]+)\""
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if 20 <= L9_1 then
      L9_1 = string
      L9_1 = L9_1.len
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 <= 1000 then
        L9_1 = MpCommon
        L9_1 = L9_1.Base64Decode
        L10_1 = L8_1
        L9_1 = L9_1(L10_1)
        L4_1 = L9_1
        if L4_1 ~= nil and L4_1 ~= "" then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:AMSI.JS.SendWithBase64Str.S1"
          L9_1(L10_1)
          break
        end
      end
    end
  end
end
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L1_1
L7_1 = "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if 10 <= L9_1 then
      L9_1 = string
      L9_1 = L9_1.len
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 <= 1000 then
        L9_1 = string
        L9_1 = L9_1.gsub
        L10_1 = L8_1
        L11_1 = "%."
        L12_1 = "_"
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:AMSI.JS.DomainWith4Parts.S1"
        L10_1(L11_1)
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:SuspDomain:"
        L12_1 = L9_1
        L11_1 = L11_1 .. L12_1
        L10_1(L11_1)
        L10_1 = L3_1[L8_1]
        if not L10_1 then
          L10_1 = table
          L10_1 = L10_1.insert
          L11_1 = L2_1
          L12_1 = L8_1
          L10_1(L11_1, L12_1)
        end
      end
    end
  end
end
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L1_1
L7_1 = "//([A-Za-z0-9]+%.[A-Za-z0-9]+)/"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if 4 <= L9_1 then
      L9_1 = string
      L9_1 = L9_1.len
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 <= 1000 then
        L9_1 = string
        L9_1 = L9_1.gsub
        L10_1 = L8_1
        L11_1 = "%."
        L12_1 = "_"
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:AMSI.JS.DomainWith2Parts.S1"
        L10_1(L11_1)
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:SuspDomain:"
        L12_1 = L9_1
        L11_1 = L11_1 .. L12_1
        L10_1(L11_1)
        L10_1 = L3_1[L8_1]
        if not L10_1 then
          L10_1 = table
          L10_1 = L10_1.insert
          L11_1 = L2_1
          L12_1 = L8_1
          L10_1(L11_1, L12_1)
        end
      end
    end
  end
end
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L1_1
L7_1 = "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if 8 <= L9_1 then
      L9_1 = string
      L9_1 = L9_1.len
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 <= 1000 then
        L9_1 = L3_1[L8_1]
        if not L9_1 then
          L9_1 = table
          L9_1 = L9_1.insert
          L10_1 = L2_1
          L11_1 = L8_1
          L9_1(L10_1, L11_1)
        end
      end
    end
  end
end
L5_1 = table_dedup
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L2_1 = L5_1
L5_1 = {}
L6_1 = ipairs
L7_1 = L2_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L12_1 = L10_1
  L11_1 = L10_1.match
  L13_1 = "^([^:/?#]+)://(.+)$"
  L11_1, L12_1 = L11_1(L12_1, L13_1)
  if not L11_1 then
    L13_1 = "http://"
    L14_1 = table
    L14_1 = L14_1.insert
    L15_1 = L5_1
    L16_1 = L13_1
    L17_1 = L10_1
    L16_1 = L16_1 .. L17_1
    L14_1(L15_1, L16_1)
  else
    L13_1 = table
    L13_1 = L13_1.insert
    L14_1 = L5_1
    L15_1 = L10_1
    L13_1(L14_1, L15_1)
  end
end
L2_1 = L5_1
L6_1 = ""
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_SCANREASON
L7_1 = L7_1(L8_1)
L8_1 = mp
L8_1 = L8_1.SCANREASON_AMSI
if L7_1 == L8_1 then
  L8_1 = pcall
  L9_1 = mp
  L9_1 = L9_1.get_contextdata
  L10_1 = mp
  L10_1 = L10_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L8_1, L9_1 = L8_1(L9_1, L10_1)
  if L8_1 and L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L6_1 = L10_1
  end
end
L8_1 = MpCommon
L8_1 = L8_1.PathToWin32Path
L9_1 = L6_1
L8_1 = L8_1(L9_1)
L9_1 = mp
L9_1 = L9_1.GetMotwZoneForFile
L10_1 = L8_1
L9_1, L10_1 = L9_1(L10_1)
L11_1 = mp
L11_1 = L11_1.GetMotwHostUrlForFile
L12_1 = L8_1
L11_1, L12_1 = L11_1(L12_1)
if L2_1 ~= nil then
  L13_1 = #L2_1
  if L13_1 ~= 0 then
    goto lbl_289
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
do return L13_1 end
::lbl_289::
L13_1 = {}
L13_1.SIG_CONTEXT = "LUA_GENERIC"
L13_1.CONTENT_SOURCE = "AMSI_JS"
L13_1.PROCESS_CONTEXT = "JS Caller"
L13_1.PARENT_CONTEXT = nil
L13_1.FILELESS = "true"
L13_1.CMDLINE_URL = "false"
L13_1.BREAK_AT_FIRST_HIT_MALWARE = "60"
L13_1.BREAK_AT_FIRST_HIT_PHISH = "60"
L14_1 = L10_1 or L14_1
if not L10_1 then
  L14_1 = ""
end
L13_1.script_zone = L14_1
L14_1 = L12_1 or L14_1
if not L12_1 then
  L14_1 = ""
end
L13_1.script_motw = L14_1
L14_1 = L8_1 or L14_1
if not L8_1 then
  L14_1 = ""
end
L13_1.script_path = L14_1
L14_1 = CheckUrlReputationSimple
L15_1 = L2_1
L16_1 = L13_1
L17_1 = 60
L14_1 = L14_1(L15_1, L16_1, L17_1)
if L14_1 then
  L15_1 = mp
  L15_1 = L15_1.set_mpattribute
  L16_1 = "Lua:AMSI.JS.BadDomainFound.S1"
  L15_1(L16_1)
end
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
