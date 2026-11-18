-- Threat: !InfrastructureShared
-- Name: !#Lua:OfficeEop.A
-- Type: 13
-- MpAttributes: AGGR:OfficeFileOLE

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0:match("%->%(msg%)") then
    return mp.CLEAN
  end
  local l_0_1 = {
    "ALF:Exploit:O97M/",
    "SLF:Exploit:O97M/",
    "ALF:SCRIPT:O97M",
    "SLF:Trojan:O97M",
    "ALF:Trojan:O97M/",
    "Lowfi:Exploit:O97M"
  }
  local l_0_2 = 0
  for l_0_3, l_0_4 in pairs(l_0_1) do
    local l_0_5 = mp.enum_mpattributesubstring(l_0_4)
    if l_0_5 ~= nil and type(l_0_5) == "table" then
      l_0_2 = l_0_2 + #l_0_5
      if 3 <= l_0_2 then
        return mp.INFECTED
      end
    end
  end
  local l_0_6 = {
    "TEL:Exploit:O97M",
    "SCPT:Exploit:O97",
    "TEL:Exploit:RTF",
    "TEL:Lowfi:Exploit:O97M",
    "SCRIPT:CVE-",
    "SCPT:Ploty.CVE-",
    "SCPT:RTF/CVE-",
    "SCPT:TrojanDownloader:O97M",
    "Exploit:O97M"
  }
  local l_0_7 = 0
  for l_0_8, l_0_9 in pairs(l_0_6) do
    local l_0_10 = mp.enum_mpattributesubstring(l_0_9)
    if l_0_10 ~= nil and type(l_0_10) == "table" then
      l_0_7 = #l_0_10 + l_0_7
      if l_0_2 == 1 and 4 <= l_0_7 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
