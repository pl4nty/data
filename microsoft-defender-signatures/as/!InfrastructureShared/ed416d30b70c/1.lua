-- Threat: !InfrastructureShared
-- Name: ed416d30b70c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = nri.GetRawRequestBlob()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = string.find(l_0_1, "<rsp:command>", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2 + 13
local l_0_4 = string.find(l_0_1, "</rsp:command>", l_0_3, true)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = string.sub(l_0_1, l_0_3, l_0_4 - 1)
local l_0_6 = false
if string.find(l_0_5, "powershell", 1, true) and (string.find(l_0_5, "-enc", 1, true) or string.find(l_0_5, "encodedcommand", 1, true)) then
  l_0_6 = true
end
if not l_0_6 and (string.find(l_0_5, "certutil", 1, true) and string.find(l_0_5, "-urlcache", 1, true) or string.find(l_0_5, "bitsadmin", 1, true) and string.find(l_0_5, "/transfer", 1, true) or string.find(l_0_5, "downloadstring", 1, true) or string.find(l_0_5, "downloadfile", 1, true)) then
  l_0_6 = true
end
if not l_0_6 and (string.find(l_0_5, "sekurlsa", 1, true) or string.find(l_0_5, "invoke-mimikatz", 1, true) or string.find(l_0_5, "comsvcs", 1, true) and string.find(l_0_5, "minidump", 1, true)) then
  l_0_6 = true
end
if not l_0_6 and (string.find(l_0_5, "vssadmin", 1, true) and string.find(l_0_5, "delete", 1, true) or string.find(l_0_5, "wevtutil", 1, true) and string.find(l_0_5, " cl ", 1, true)) then
  l_0_6 = true
end
if not l_0_6 then
  local l_0_7 = string.find(l_0_1, "<rsp:arguments>", 1, true)
  if l_0_7 ~= nil then
    local l_0_8 = l_0_7 + 15
    local l_0_9 = string.find(l_0_1, "</rsp:arguments>", l_0_8, true)
    if l_0_9 ~= nil then
      local l_0_10 = string.sub(l_0_0, l_0_8, l_0_9 - 1)
      local l_0_11 = string.match(l_0_10, "^%s*(.-)%s*$") or ""
      if 4 < #l_0_11 then
        local l_0_12, l_0_13 = pcall(MpCommon.Base64Decode, l_0_11)
        if l_0_12 and l_0_13 ~= nil then
          local l_0_14 = string.lower(l_0_13)
          if string.find(l_0_14, "invoke-expression", 1, true) or string.find(l_0_14, "invoke-mimikatz", 1, true) or string.find(l_0_14, "frombase64string", 1, true) or string.find(l_0_14, "amsiutils", 1, true) or string.find(l_0_14, "net.webclient", 1, true) or string.find(l_0_14, "set-mppreference", 1, true) or string.find(l_0_14, "downloadstring", 1, true) then
            l_0_6 = true
          end
        end
      end
    end
  end
end
if not l_0_6 then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH))
reportHeaders({"Host", "User-Agent"})
return mp.INFECTED
